import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/otp/view.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

part 'states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInit());

  static AuthCubit of(context) => BlocProvider.of(context);
  String? phone, email;

  final formKey = GlobalKey<FormState>();

  bool get isStateLoading {
    return state is AuthLoading;
  }

  void _emit(AuthStates state) {
    if (!isClosed) {
      emit(state);
    }
  }

  // login Or Register By Telephone Or Email

  Future<void> loginByPhone() async {
    if (formKey.currentState?.validate() == false) return;
    formKey.currentState?.save();
    emit(AuthLoading());
    try {
      final response = await NetworkUtils.post(
        'register',
        data:  {
          "telephone" : phone,
        },);
      final data = response.data;
      if (data['status_code'] == 200) {
        // Go To Verify Page
        RouteUtils.navigateTo(OtpView(
          phone: phone!,
          userId: data['data']['user_id'],
        ),);
      }
    } catch (e) {
      handleGenericException(e);
      print(e);
    }
    emit(AuthInit());
  }

  Future<void> loginByEmail() async {
    if (formKey.currentState?.validate() == false) return;
    formKey.currentState?.save();
    emit(AuthLoading());
    try {
      final response = await NetworkUtils.post(
        'register',
        data:  {
          "email": email,
        },);
      final data = response.data;
      if (data['status_code'] == 200) {
        // Go To Verify Page
        RouteUtils.navigateTo(OtpView(
          email: email,
          userId: data['data']['user_id'],
        ),);
      }
    } catch (e) {
      handleGenericException(e);
      print(e);
    }
    emit(AuthInit());
  }



}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/navbar/view.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

part 'states.dart';

class ContactUsCubit extends Cubit<ContactUsStates> {
  ContactUsCubit() : super(ContactUsInit());

  static ContactUsCubit of(context) => BlocProvider.of(context);

  String? fullName,phone, email, message;

  final formKey = GlobalKey<FormState>();

  bool get isStateLoading {
    return state is ContactUsLoading;
  }

  Future<void> contactUs() async {
    if (formKey.currentState?.validate() == false) return;
    formKey.currentState?.save();
    emit(ContactUsLoading());
    try {
      final response = await NetworkUtils.post(
        'contact-us',
        data:  {
          "full_name" : fullName,
          "telephone" : phone,
          "message" : message,
          "email": email,
        },);
      final data = response.data;
      showSnackBar(data["message"]);
      RouteUtils.navigateAndPopAll(NavBarView());
    } catch (e) {
      handleGenericException(e);
      print(e);
    }
    emit(ContactUsInit());
  }


}
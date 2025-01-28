import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/caching_utils/caching_utils.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/navbar/view.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

part 'states.dart';

class OtpCubit extends Cubit<OtpStates> {
  OtpCubit(this.userId) : super(OtpInit());

  static OtpCubit of(context) => BlocProvider.of(context);
  String? code;
  final int? userId;

  bool get isStateLoading {
    return state is OtpLoading;
  }

  void _emit(OtpStates state) {
    if (!isClosed) {
      emit(state);
    }
  }

  Future<void> verifyCode() async{
    emit(OtpLoading());
    try{
      final response = await NetworkUtils.post('verify-code',
          data: {
            "verification_code" : code,
            'user_id' : userId,
          });
      final data = response.data;
      if(data['status_code'] == 200){
        await getUserAndCache(data['data']['access_token']);
        RouteUtils.navigateAndPopAll(NavBarView());
      } else {
        showSnackBar(data['message'],errorMessage: true);
      }
    }catch(e){
      handleGenericException(e);
    }
    emit(OtpInit());
  }


  Future<void> resetVerifyCode() async {
    emit(OtpLoading());
    try {
      final response = await NetworkUtils.post(
        'resend-verify-code',
        data: {
          "user_id": userId,
        },
      );
      final data = response.data;
      if (data['status_code'] == 200 ) {
        showSnackBar(data['message']);
      } else {
        showSnackBar(data['message'], color: AppColors.red.theme);
      }
    } catch (e) {
      handleGenericException(e);
    }
    emit(OtpInit());
  }


}
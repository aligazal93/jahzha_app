import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/caching_utils/caching_utils.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/navbar/view.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

part 'states.dart';

class OtpUserAccountCubit extends Cubit<OtpUserAccountStates> {
  OtpUserAccountCubit(this.userId) : super(OtpUserAccountInit());

  static OtpUserAccountCubit of(context) => BlocProvider.of(context);
  String? code, email , phone;
  final int? userId;

  bool get isStateLoading {
    return state is OtpUserAccountLoading;
  }

  Future<void> verifyCode(String phone , String email) async{
    emit(OtpUserAccountLoading());
    try{
      final response = await NetworkUtils.post('verify-to-update',
          data: {
            "verify_code" : code,
            'phone' : phone,
            "email" : email,
          });
      final data = response.data;
      if(data['status_code'] == 200){
        await getUserAndCache(CachingUtils.token!);
        RouteUtils.navigateAndPopAll(NavBarView());
        showSnackBar(data['message'],color: AppColors.green);
      } else {
        showSnackBar(data['message'],errorMessage: true);
      }
    }catch(e){
      handleGenericException(e);
    }
    emit(OtpUserAccountInit());
  }

  Future<void> resetVerifyCode() async {
    emit(OtpUserAccountLoading());
    try {
      final response = await NetworkUtils.post(
        'resend-code-to-update-info',
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
    emit(OtpUserAccountInit());
  }

}
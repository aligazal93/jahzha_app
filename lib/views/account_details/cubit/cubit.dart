import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/caching_utils/caching_utils.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/account_details/cubit/states.dart';
import 'package:jahzha_app/views/account_details/units/change_mobileNumber_sheet.dart';
import 'package:jahzha_app/views/account_details/units/otp_sheet_modal.dart';
import 'package:jahzha_app/views/otp/view.dart';
import 'package:jahzha_app/views/otp_user_account/view.dart';
import 'package:jahzha_app/widgets/app_date_picker.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsStates> {
  AccountDetailsCubit() : super(AccountDetailsInitState());

  static AccountDetailsCubit of(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  // String? birthdate = Utils.formatDate(CachingUtils.user?.data.birthdate);
  final birthdateTXController = TextEditingController(text: Utils.formatDate(CachingUtils.user?.data.birthdate));
  String? name = CachingUtils.user?.data.name;
  String? email = CachingUtils.user?.data.email;
  String? phone = CachingUtils.user?.data.phoneNumber;
  String? gender = CachingUtils.user?.data.gender;
  bool? isSelected;

  void changeGender(String v) {
    gender = v;
    emit(AccountDetailsInitState());
  }
  // void selectDate() async {
  //   final result = await DatePicker(onPick: (DateTime ) {
  //     dateController.text = Utils.formatDate(result);
  //   },);
  //   if (result != null) {
  //     dateController.text = Utils.formatDate(result);
  //   }
  // }

  void showChangeNumberSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: RouteUtils.context,
      builder: (context) {
        return ChangeMobileNumber();
      },
    );
  }

  void toggleGender(String value) {
    gender = value;
    emit(AccountDetailsInitState());
  }

  Future<void> updateInfo() async {
    formKey.currentState?.save();
    if (formKey.currentState?.validate() == false) return;
    emit(AccountDetailsLoadingState());
    try {
      final response = await NetworkUtils.post(
        'update-info',
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "birthdate": birthdateTXController.text,
          "gender": gender,
        },
      );
      final success = response.data['status_code'] == 200;
      if (response.data['message'] == "تم إرسال الرمز بنجاح") {
        await getUserAndCache(CachingUtils.token!);
        RouteUtils.navigateTo(
          OtpUserVerifyView(
          userId: CachingUtils.user!.data.id,
          email: email,
          phone: phone,
          ),
        );
      } else {
        await getUserAndCache(CachingUtils.token!);
      }
      showSnackBar(response.data['message'], errorMessage: !success);
    } catch (e) {
      handleGenericException(e);
    }
    emit(AccountDetailsInitState());
  }

  void selectBirthdate() async {
    final maximumDate = DateTime.now().subtract(Duration(days: 365 * 18));
    final minimumDate = Utils.getMinimumDate;
    final initialDate = Utils.getMinimumDate;
    final result = await AppDatePicker.show(
      title: 'select date of birth'.tr(),
      initialDate: initialDate,
      maximumDate: maximumDate,
      minimumDate: minimumDate,
    );
    if (result != null) {
      birthdateTXController.text = Utils.formatDate(result);
      print(birthdateTXController.text);
    }
  }

  // void selectBirthDate() async {
  //   final result = await DatePicker.show(title: 'اختر تاريخ ميلادك');
  //
  //   if (result != null) {
  //     birthDateController.text = Utils.formatDate(result);
  //     print('تاريخ الميلاد المختار: ${birthDateController.text}');
  //   } else {
  //     print('لم يتم اختيار أي تاريخ');
  //   }
  // }


  // void showOtpSheet() {
  //   showModalBottomSheet(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(20),
  //       ),
  //     ),
  //     context: RouteUtils.context,
  //     builder: (context) {
  //       return OtpSheetModalView();
  //     },
  //   );
  // }
}

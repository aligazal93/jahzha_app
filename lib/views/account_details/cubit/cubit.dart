import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/account_details/cubit/states.dart';
import 'package:jahzha_app/views/account_details/units/change_mobileNumber_sheet.dart';
import 'package:jahzha_app/views/account_details/units/otp_sheet_modal.dart';
import 'package:jahzha_app/widgets/app_date_picker.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsStates> {
  AccountDetailsCubit() : super(AccountDetailsInitState());

  static AccountDetailsCubit of(context) => BlocProvider.of(context);

  bool? isSelected;
  String? gender;


  void selectDate() async {
    final result = await AppDatePicker.show(title: 'Date Of Birth');
    if (result != null) {
      // dateController.text = Utils.formatDate(result);
    }
  }

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
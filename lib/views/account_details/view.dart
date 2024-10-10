import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/validator.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/account_details/cubit/cubit.dart';
import 'package:jahzha_app/views/account_details/cubit/states.dart';
import 'package:jahzha_app/views/account_details/units/change_mobileNumber_sheet.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';
part 'units/confirm_button.dart';
part 'units/form_fields.dart';

class AccountDetailsView extends StatelessWidget {
  const AccountDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountDetailsCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'account details'.tr(),
        ),
        body: BlocBuilder<AccountDetailsCubit,AccountDetailsStates>(
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 12),
              children: [
                _FormFields(),
                _ConfirmButton()
              ],
            );
          },
        ),
      ),
    );
  }
}

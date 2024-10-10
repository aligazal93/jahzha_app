import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/views/edit_address/cubit/cubit.dart';
import 'package:jahzha_app/views/edit_address/cubit/states.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';
part 'units/form_fields.dart';
part 'units/primary_address.dart';
part 'units/confirm_button.dart';

class EditAddressView extends StatelessWidget {
  const EditAddressView({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditAddressCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'edit address'.tr(),
        ),
        body: BlocBuilder<EditAddressCubit, EditAddressStates>(
          builder: (context, state) {
            final cubit = EditAddressCubit.of(context);
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _FormFields(),
                _PrimaryAddress(),
                _ConfirmButton()
              ],
            );
          },
        ),
      ),
    );
  }
}

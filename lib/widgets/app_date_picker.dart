

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key, this.hint, this.upperText, required this.onPick, this.firstDate})
      : super(key: key);

  final String? hint;
  final String? upperText;
  final Function(DateTime) onPick;
  final DateTime? firstDate;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? date;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hint: widget.hint,
      controller: controller,
      label: widget.upperText,
      fillColor: AppColors.whiteBk,
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: widget.firstDate ?? DateTime.now().subtract(Duration(days: 9999 * 9999)),
          lastDate: DateTime.now().add(Duration(days: 99 * 99)),
        );
        if (date != null) {
          this.date = date;
          controller.text = Utils.formatDate(date);
          widget.onPick(date);
          setState(() {});
          Utils.closeKeyboard();
        }
      },
    );
  }
}
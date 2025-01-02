import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/helpers/app_colors.dart';
import '../core/route_utils/route_utils.dart';
import 'app_button.dart';
import 'app_text.dart';

class AppDatePicker extends StatefulWidget {
  const AppDatePicker({
    Key? key,
    required this.title,
    required this.minimumDate,
    required this.maximumDate,
    required this.initialDate,
  }) : super(key: key);

  final String? title;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialDate;

  static Future<DateTime?> show({
    String? title,
    DateTime? initialDate,
    DateTime? minimumDate,
    DateTime? maximumDate,
  }) {
    return showModalBottomSheet(
      context: RouteUtils.context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      builder: (context) {
        return AppDatePicker(
          title: title,
          initialDate: initialDate,
          minimumDate: minimumDate,
          maximumDate: maximumDate,
        );
      },
    );
  }

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  final now = DateTime.now();
  DateTime? selectedDate;

  @override
  void initState() {
    selectedDate = widget.initialDate ?? (widget.minimumDate != null && now.isAfter(widget.minimumDate!) ? now : widget.minimumDate) ?? now;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onClosing: () {},
        builder: (context) {
          return Localizations(
            delegates: context.localizationDelegates,
            locale: Locale('en'),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.title != null) ...[
                    SizedBox(height: 20),
                    AppText(
                      title: widget.title!,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                  Expanded(
                    child: CupertinoTheme(
                      data: CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: TextStyle(
                            fontSize: 18,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      child: CupertinoDatePicker(
                        itemExtent: 40,
                        initialDateTime: selectedDate ?? widget.initialDate ?? now,
                        minimumDate: widget.minimumDate ?? now,
                        maximumDate: widget.maximumDate,
                        onDateTimeChanged: (value) => selectedDate = value,
                        mode: CupertinoDatePickerMode.date,
                        // onSelectedItemChanged: (value) => selectedIndex = value,
                        // useMagnifier: true,
                        // children: years.map((e) {
                        //   return Container(
                        //     alignment: Alignment.center,
                        //     child: AppText(
                        //       title: e.toString(),
                        //       fontSize: 24,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   );
                        // }).toList(),
                      ),
                    ),
                  ),
                  AppButton(
                    title: 'save'.tr(),
                    onTap: () => Navigator.pop(context, selectedDate),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
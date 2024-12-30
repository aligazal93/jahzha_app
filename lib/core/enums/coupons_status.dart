import 'package:easy_localization/easy_localization.dart';

enum CouponsStatus {
  used("used"),
  notUsed("notUsed"),
  inactive("inactive");

  const CouponsStatus(this._title);

  final String _title;
  String get title => _title.tr();
}

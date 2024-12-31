enum CouponsStatus {
  used("used"),
  notUsed("not_used"),
  inactive("inactive");

  const CouponsStatus(this._title);

  final String _title;

  String get title => _title;

  // Static method to convert a string to a CouponsStatus
  static CouponsStatus fromString(String value) {
    return CouponsStatus.values.firstWhere(
          (status) => status._title == value,
      orElse: () => throw ArgumentError("Invalid CouponsStatus value: $value"),
    );
  }
}
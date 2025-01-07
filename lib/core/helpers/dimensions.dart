import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Dimentions on int {
  double get height => _height();

  double get width => _width();

  double get font => _font();

  double get radius => _radius();

  double _height() {
    return (this).h;
  }

  double _width() {
    return (this).w;
  }

  double _font() {
    return (this).sp;
  }

  double _radius() {
    return (this).r;
  }
}

extension SizeExtension on BuildContext {
  double height(double fraction) => MediaQuery.of(this).size.height / fraction;
  double width(double fraction) => MediaQuery.of(this).size.width / fraction;
}
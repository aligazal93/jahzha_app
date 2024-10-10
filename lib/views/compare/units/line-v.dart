part of '../view.dart';

class LineVertical extends StatelessWidget {
  const LineVertical({Key? key, required this.height}) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1,
      height: height.toDouble(),
      child: Container(
        color: AppColors.tGray,
      ),
    );
  }
}

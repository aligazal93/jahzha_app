part of '../view.dart';
class TrackingCircle extends StatelessWidget {
  const TrackingCircle({Key? key, required this.image, required this.color}) : super(key: key);
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            border: Border.all(
                color: color
            )
        ),
        child: Image.asset(image),
      ),
    );
  }
}

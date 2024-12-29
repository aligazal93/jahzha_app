part of '../view.dart';
class _ResendCodeSection extends StatefulWidget {
  const _ResendCodeSection({Key? key}) : super(key: key);
  @override
  __ResendCodeSectionState createState() => __ResendCodeSectionState();
}

class __ResendCodeSectionState extends State<_ResendCodeSection> {
  final int counter = 60;

  int seconds = 0;
  Timer? _timer;

  @override
  void initState() {
    count();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void count() {
    setState(() => seconds = counter);
    if (_timer != null) _timer!.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds <= 0) {
        timer.cancel();
      } else {
        setState(() => seconds--);
      }
    });
  }

  final _style = TextStyle(color: AppColors.lightGray, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: seconds != 0 ? Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Center(
          child: Text(
            '00:' + seconds.toString().padLeft(2, '0'),
            style: _style,
          ),
        ),
      ) : TextButton(
        onPressed: () {
          count();
          // OTPCubit.of(context).resendCode();
        },
        child: AppText(
          title: 'Resend OTP'.tr(),
          color: AppColors.darkGrayBlue,
          fontSize: 15,
        ),
      ),
    );
  }
}
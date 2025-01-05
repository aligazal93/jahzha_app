part of '../view.dart';

class _ResendCodeSection extends StatefulWidget {
  const _ResendCodeSection({Key? key}) : super(key: key);
  @override
  __ResendCodeSectionState createState() => __ResendCodeSectionState();
}

class __ResendCodeSectionState extends State<_ResendCodeSection> {
  Timer? _timer;
  int _secondsRemaining = 0;

  void _startTimer() {
    setState(() {
      _secondsRemaining = 60;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpUserAccountCubit,OtpUserAccountStates>(
      builder: (context, state) {
        final cubit = OtpUserAccountCubit.of(context);
        return Column(
          children: [
            if (_secondsRemaining > 0)
              Text(
                '00:' + _secondsRemaining.toString().padLeft(2, '0'),
                style: TextStyle(fontSize: 16, color: AppColors.primary),
              ),
            if (_secondsRemaining == 0)
              InkWell(
                onTap: () {
                  cubit.resetVerifyCode();
                  _startTimer();
                },
                child: AppText(
                  title: 'Resend'.tr(),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  textAlign: TextAlign.center,
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
              ),
          ],
        );
      },
    );
  }
}

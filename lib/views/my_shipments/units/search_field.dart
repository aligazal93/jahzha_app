part of '../view.dart';

class _SearchField extends StatelessWidget {
  const _SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hint: 'Search for shipments'.tr(),
      suffixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: UnconstrainedBox(
          child: Image.asset(
            'assets/images/search.png',
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}

part of '../view.dart';
class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountDetailsCubit,AccountDetailsStates>(
      builder: (context, state) {
        final cubit = AccountDetailsCubit.of(context);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: AppButton(
                  title: 'Updating data'.tr(),
                  color: AppColors.primary,
                  constrainedAxis: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  titleFontSize: 16,
                  onTap: () {
                    cubit.updateInfo();
                  },
                  isLoading: state is AccountDetailsLoadingState ? true : false,
                ),
                flex: 2,
              ),
              SizedBox(width: 8,),
              Expanded(
                child: AppButton(
                  title: 'cancel'.tr(),
                  color: AppColors.txtGray,
                  constrainedAxis: Axis.horizontal,
                  titleFontSize: 16,
                  padding: EdgeInsets.zero,
                  onTap: () {
                    RouteUtils.pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

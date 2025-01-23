part of '../view.dart';

class _SearchField extends StatelessWidget {
  const _SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = MyShipmentsCubit.of(context);
    return AppTextField(
      hint: 'Search for shipments'.tr(),
      controller: cubit.searchTXController,
      onChanged: (_) => cubit.search(),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: UnconstrainedBox(
          child: Image.asset(
            'assets/images/search.png',
            width: 20,
            height: 20,
          ),
        ),
      ),
      suffixIcon: cubit.isSearching
          ? InkWell(
              onTap: cubit.resetSearch,
              child: Icon(
                FontAwesomeIcons.xmark,
                color: AppColors.txtGray,
                size: 20,
              ),
            )
          : null,
    );
  }
}

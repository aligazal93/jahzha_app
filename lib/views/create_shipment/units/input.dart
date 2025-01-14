part of '../view.dart';

class _Input extends StatelessWidget {
  const _Input({Key? key, required this.input}) : super(key: key);

  final ShippingInput input;

  @override
  Widget build(BuildContext context) {
    final cubit = CreateShipmentCubit.of(context);
    final dto = cubit.dto;
    if (input.type == ShippingInputType.textField ||
        input.type == ShippingInputType.textFieldArea ||
        input.type == ShippingInputType.readOnlyField) {
      final isReadOnly = input.type == ShippingInputType.readOnlyField;
      return AppTextField(
        prefixIcon: !isReadOnly &&
                input.validation.type == ShippingInputValidationType.phone
            ? AppCountryPicker(
                initialPhoneCode: input.phoneCode,
                onSelect: (country, code) => input.phoneCode = code,
              )
            : null,
        controller: input.controller,
        fillColor: isReadOnly ? AppColors.darkGrayBlue : AppColors.whiteBk,
        label: input.name,
        hint: input.note,
        suffixIcon: isReadOnly
            ? Icon(
                FontAwesomeIcons.lock,
                color: AppColors.lightGray,
                size: 16,
              )
            : null,
        inputType: input.validation.inputType,
        onTap: isReadOnly ? () {} : null,
        maxLines: input.type == ShippingInputType.textFieldArea ? 5 : 1,
        validator: (v) => input.validate(
          cubit.currentPage == 1
              ? dto.destination?.countryCode
              : dto.origin?.countryCode,
        ),
        showRequiredSign: input.validation.required,
      );
    } else if (input.type == ShippingInputType.dropdown) {
      return _DropMenu(input: input);
    }
    return AppText(
      title: 'Unsupported input type\n${input.type.name}',
      color: AppColors.red,
      fontSize: 16,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w700,
    );
  }
}

class _DropMenu extends StatelessWidget {
  const _DropMenu({Key? key, required this.input}) : super(key: key);

  final ShippingInput input;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      fillColor: AppColors.whiteBk,
      showRequiredSign: input.validation.required,
      suffixIcon: Icon(
        FontAwesomeIcons.chevronDown,
        color: AppColors.lightGray,
        size: 16,
      ),
      onTap: _DropMenuSheet(
        cubit: CreateShipmentCubit.of(context),
        input: input,
      ).show,
      controller: input.controller,
      label: input.name,
      hint: input.note,
      validator: (v) => input.validate(),
    );
  }
}

class _DropMenuSheet extends StatefulWidget {
  const _DropMenuSheet({
    Key? key,
    required this.cubit,
    required this.input,
  }) : super(key: key);

  Future<void> show() {
    return AppSheet.show(child: this);
  }

  final CreateShipmentCubit cubit;
  final ShippingInput input;

  @override
  State<_DropMenuSheet> createState() => _DropMenuSheetState();
}

class _DropMenuSheetState extends State<_DropMenuSheet> {
  final txController = TextEditingController();
  Timer? _debouncingTimer;
  List<ShippingDropDownItem> items = [];
  bool isLoading = true;

  @override
  void initState() {
    getItems(1);
    super.initState();
  }

  Future<List<ShippingDropDownItem>> getItems(int page) async {
    if (page == 1) {
      isLoading = true;
      items = [];
      updateUI();
    }
    final result = await ShippingDatasource().getDropDownItems(
      page: page,
      offerID: widget.cubit.offerID,
      inputID: widget.input.id!,
      search: txController.text.trim(),
    );
    items.addAll(result);
    updateUI();
    if (page == 1) {
      isLoading = false;
      updateUI();
    }
    return result;
  }

  void resetSearch() {
    txController.clear();
    _debouncingTimer?.cancel();
    getItems(1);
    updateUI();
  }

  void updateUI() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _debouncingTimer?.cancel();
    txController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final input = widget.input;
    if (isLoading) {
      return AppLoadingIndicator();
    }
    return BlocBuilder(
      bloc: widget.cubit,
      builder: (context, state) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: context.height(1.25) - Utils.keyboardHeight(context),
          ),
          child: Column(
            children: [
              if (input.enableDropDownSearch)
                AppTextField(
                  fillColor: AppColors.whiteBk,
                  controller: txController,
                  label: 'search'.tr(),
                  onChanged: (v) {
                    if (v.trim().isEmpty) {
                      return;
                    }
                    _debouncingTimer?.cancel();
                    _debouncingTimer = Timer(
                      Duration(milliseconds: 1200),
                      () => getItems(1),
                    );
                  },
                  suffixIcon: txController.text.trim().isEmpty
                      ? null
                      : InkWell(
                          onTap: resetSearch,
                          child: Icon(
                            FontAwesomeIcons.xmark,
                            color: AppColors.darkGrayBlue,
                            size: 16,
                          ),
                        ),
                ),
              if (items.isEmpty)
                EmptyView(
                  title: "no_result".tr(),
                )
              else
                Expanded(
                  child: AppPaginatedScroll(
                    items: items,
                    getPaginatedItems: getItems,
                    builder: (context) => ListView.separated(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: AppText(
                            title: item.name,
                          ),
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                          contentPadding: EdgeInsets.zero,
                          value: input.selectedValue?.id == item.id,
                          activeColor: AppColors.primary,
                          onChanged: (value) {
                            if (value == true) {
                              input.selectedValue = item;
                              input.controller.text = item.name;
                              widget.cubit.updateUI();
                              RouteUtils.pop();
                            }
                          },
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 8),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

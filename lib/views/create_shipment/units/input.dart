part of '../view.dart';

class _Input extends StatelessWidget {
  const _Input({Key? key, required this.input}) : super(key: key);

  final ShippingInput input;

  @override
  Widget build(BuildContext context) {
    final cubit = CreateShipmentCubit.of(context);
    final dto = cubit.dto;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(
          builder: (context) {
            if (input.type == ShippingInputType.textField ||
                input.type == ShippingInputType.textFieldArea ||
                input.type == ShippingInputType.readOnlyField) {
              final isReadOnly = input.type == ShippingInputType.readOnlyField;
              return AppTextField(
                prefixIcon: !isReadOnly &&
                        input.validation.type ==
                            ShippingInputValidationType.phone
                    ? AppCountryPicker(
                  initialPhoneCode: input.phoneCode ??
                            CountryCode.fromCountryCode((cubit.currentPage == 1
                                    ? dto.destination?.countryCode
                                    : dto.origin?.countryCode)!)
                                .dialCode!,
                        onSelect: (country, code) => input.phoneCode = code,
                      )
                    : null,
                controller: input.controller,
                fillColor:
                    isReadOnly ? AppColors.darkGrayBlue : AppColors.whiteBk,
                label: input.name,
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _DropMenu(input: input),
                  if (input.selectedValue?.helpImage != null) ...[
                    SizedBox(height: 12),
                    InkWell(
                      onTap:
                          ImageView(url: input.selectedValue!.helpImage!).show,
                      child: AppNetworkImage(
                        url: input.selectedValue!.helpImage!,
                        // height: 260,
                        borderColor: AppColors.darkGrayBlue,
                        borderRadius: 16,
                      ),
                    ),
                  ],
                ],
              );
            } else if (input.type == ShippingInputType.radio) {
              final isSelected = input.controller.text == '1';
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        value: isSelected,
                        activeColor: AppColors.primary,
                        onChanged: (value) {
                          input.controller.text = '${isSelected ? 0 : 1}';
                          cubit.updateUI();
                        },
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: AppText(
                          padding: EdgeInsets.only(
                            top: 6,
                          ),
                          title: input.name,
                        ),
                      ),
                      AppText(
                        fontSize: 20,
                        title: ' *',
                        color: AppColors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  if (input.validation.required && !isSelected) ...[
                    SizedBox(height: 8),
                    AppText(
                      title: 'required'.tr(),
                      color: AppColors.red,
                      fontSize: 12,
                    ),
                  ]
                ],
              );
            } else if (input.type == ShippingInputType.googlePlacesField) {
              final prediction = cubit.currentPage == 1 ? dto.destination : dto.origin;
              return Padding(
                padding: const EdgeInsets.only(top: 12),
                child: GooglePlacesTextFormField(
                  controller: input.controller,
                  label: input.name,
                  fillColor: AppColors.whiteBk,
                  showRequiredSign: input.validation.required,
                  validator: input.validate,
                  countries: [
                    prediction!.countryCode!
                  ],
                  placeType: PlaceType.address,
                  placeBounds: prediction.bounds!,
                  onSelected: (value) {
                    input.controller.text = value.structuredFormatting?.mainText ?? '';
                  },
                ),
              );
            }
            return AppText(
              title: 'Unsupported input type\n${input.type.name}',
              color: AppColors.red,
              fontSize: 16,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
            );
          },
        ),
        if (input.note != null) ...[
          Html(
            data: input.note!,
            style: {
              "html": Style(
                color: AppColors.lightGray,
                fontSize: FontSize(12),
                lineHeight: LineHeight(24 / 12),
              ),
            },
            onLinkTap: (url, attributes, element) {
              if (url == null) return;
              launchUrl(Uri.parse(url));
            },
          ),
        ],
      ],
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
    return AppSheet.show(
      title: input.name,
      subtitle: input.enableDropDownSearch ? null : '',
      child: this,
    );
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
      offerID: widget.cubit.offer.id,
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
    final bottomPadding = EdgeInsets.only(
      bottom: Platform.isAndroid ? 16.height : 0,
    );
    if (isLoading) {
      return SafeArea(
        child: AppLoadingIndicator(
          padding: bottomPadding,
        ),
      );
    }
    return SafeArea(
      child: BlocBuilder(
        bloc: widget.cubit,
        builder: (context, state) {
          return Container(
            margin: bottomPadding,
            constraints: BoxConstraints(
              maxHeight:
                  context.height(input.enableDropDownSearch ? 1.5 : 2.5) -
                      Utils.keyboardHeight(context),
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
                Expanded(
                  child: AppPaginatedScroll(
                    enabled: input.enableDropDownSearch,
                    items: items,
                    getPaginatedItems: getItems,
                    builder: (context) {
                      if (items.isEmpty) {
                        EmptyView(
                          title: "no_result".tr(),
                        );
                      }
                      return ListView.separated(
                        itemCount: items.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          final isSelected = input.selectedValue?.id == item.id;
                          if (item.image != null) {
                            return InkWell(
                              onTap: () {
                                if (isSelected) {
                                  return;
                                }
                                input.selectedValue = item;
                                input.controller.text = item.name;
                                widget.cubit.updateUI();
                                RouteUtils.pop();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                child: Row(
                                  children: [
                                    AppNetworkImage(
                                      url: item.image!,
                                      width: 64,
                                      height: 64,
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: AppText(
                                        title: item.name,
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.darkGrayBlue,
                                  ),
                                ),
                              ),
                            );
                          }
                          return CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: AppText(
                              title: item.name,
                            ),
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -4),
                            contentPadding: EdgeInsets.zero,
                            value: isSelected,
                            activeColor: AppColors.primary,
                            onChanged: (value) {
                              if (isSelected) {
                                return;
                              }
                              input.selectedValue = item;
                              input.controller.text = item.name;
                              widget.cubit.updateUI();
                              RouteUtils.pop();
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

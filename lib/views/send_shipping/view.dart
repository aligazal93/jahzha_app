import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/validator.dart';
import 'package:jahzha_app/widgets/app/solid_appbar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

import '../../widgets/google_places_text_form_field.dart';
import 'cubit.dart';

class SendShippingView extends StatelessWidget {
  const SendShippingView({
    Key? key,
    required this.isLocal,
  }) : super(key: key);

  final bool isLocal;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendShippingCubit(isLocal: isLocal),
      child: BlocBuilder<SendShippingCubit, SendShippingStates>(
        builder: (context, state) {
          final cubit = SendShippingCubit.of(context);
          final dto = cubit.dto;
          return Scaffold(
            appBar: SolidAppBar(
              currentPage: cubit.currentPage,
              title: (isLocal ? 'Local shipping' : 'international shipping').tr(),
            ),
            body: Form(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: PageView(
                  controller: cubit.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          AppTextField(
                            fillColor: AppColors.whiteBk,
                            suffixIcon: AppText(
                              title: 'kg'.tr(),
                              color: AppColors.txtGray,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              padding: EdgeInsets.symmetric(vertical: 14),
                            ),
                            label: 'Approximate weight'.tr(),
                            inputType: TextInputType.number,
                            controller: dto.weightTXController,
                            validator: Validator.weight,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        children: [
                          SizedBox(height: 12),
                          if (!isLocal) ...[
                            AppTextField(
                              label: "Country".tr(),
                              hint: "Saudi Arabia".tr(),
                              fillColor: AppColors.whiteBk,
                              onTap: () {},
                            ),
                            SizedBox(height: 12),
                          ],
                          GooglePlacesTextFormField(
                            label: 'Transmitting destination'.tr(),
                            fillColor: AppColors.whiteBk,
                            controller: dto.originTXController,
                            countries: ['SA'],
                            placeType: PlaceType.cities,
                            onSelected: (value) => dto.origin = value,
                            validator: (_) => Validator.empty(dto.origin?.city),
                            onClearData: () {
                              dto.origin = null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        children: [
                          SizedBox(height: 12),
                          if (!isLocal) ...[
                            GooglePlacesTextFormField(
                              label: 'Country'.tr(),
                              fillColor: AppColors.whiteBk,
                              controller: dto.destinationCountryTXController,
                              placeType: PlaceType.cities,
                              onSelected: (value) {
                                dto.destination = null;
                                dto.destinationTXController.clear();
                                dto.destinationCountry = value;
                                dto.destinationCountryTXController.text = value.country ?? '';
                                cubit.updateUI();
                              },
                              validator: (_) => Validator.empty(dto.destinationCountry?.city),
                              onClearData: () {
                                dto.destination = null;
                                dto.destinationCountry = null;
                                cubit.updateUI();
                              },
                            ),
                            SizedBox(height: 12),
                          ],
                          if (isLocal || dto.destinationCountry?.countryCode != null)
                            GooglePlacesTextFormField(
                              label: 'Receiving destination'.tr(),
                              fillColor: AppColors.whiteBk,
                              controller: dto.destinationTXController,
                              countries: isLocal
                                  ? ['SA']
                                  : [dto.destinationCountry!.countryCode!],
                              placeType: PlaceType.cities,
                              onSelected: (value) {
                                dto.destination = value;
                                dto.destinationTXController.text = value.city ?? '';
                              },
                              validator: (_) =>
                                  Validator.empty(dto.destination?.city),
                              onClearData: () {
                                dto.destination = null;
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (cubit.currentPage > 0)
                      Expanded(
                        child: AppButton(
                          titleFontSize: 14,
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          constrainedAxis: Axis.horizontal,
                          color: AppColors.darkGrayBlue,
                          titleColor: AppColors.txtGray,
                          title: 'Previous'.tr(),
                          onTap: cubit.previousPage,
                        ),
                      ),
                    if (cubit.currentPage < 2)
                      Expanded(
                        child: AppButton(
                          titleFontSize: 14,
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          constrainedAxis: Axis.horizontal,
                          title: 'Next'.tr(),
                          onTap: cubit.nextPage,
                        ),
                      ),
                    if (cubit.currentPage == 2)
                      Expanded(
                        child: AppButton(
                          titleFontSize: 14,
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          constrainedAxis: Axis.horizontal,
                          title: 'Get offers'.tr(),
                          onTap: cubit.nextPage,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
        {
            "id": "15a9f003-e0b8-4967-9e6c-c2f6cf9a84a9",
            "offerName": "UPS Worldwide Saver",
            "offerCode": "65",
            "company": {
                "id": 6,
                "name": "يو بي اس",
                "logo": "https://jahzha22.web2html5.com/assets/uploads/shipping-company/1730020133_ups (4).svg",
                "description": "<p>يو بي اس الشحن والنقل السريع:</p>"
            },
            "estimatedDeliveryTime": "من 2 أيام إلى6 أيام",
            "shippingType": "domestic",
            "insuranceText": "غطاء حماية شركة الشحن",
            "pickupOptions": {
                "pickupByCurrentCompany": {
                    "pickupStatus": true,
                    "PickupFee": "100.00"
                }
            },
            "rewardPoints": 20,
            "isNew": false,
            "isFastest": false,
            "isCheapest": false,
            "totalPrice": "123.00",
            "currency": "SAR"
        },
        {
            "id": "cd2ecde2-3ec6-4cff-8fbc-6f80ccdd75d3",
            "offerName": "Next Day Delivery Up to 15 KG",
            "offerCode": "NEXT_DAY_DELIVERY",
            "company": {
                "id": 4,
                "name": "ثابت",
                "logo": "https://jahzha22.web2html5.com/assets/uploads/shipping-company/1727254769_thabit_logo.png",
                "description": "<p>ثابت الشحن والنقل السريع:</p>"
            },
            "estimatedDeliveryTime": "من 2 أيام إلى5 أيام",
            "shippingType": "domestic",
            "insuranceText": "غطاء حماية شركة الشحن",
            "pickupOptions": {
                "pickupByCurrentCompany": {
                    "pickupStatus": true,
                    "PickupFee": "5.00"
                }
            },
            "rewardPoints": 20,
            "isNew": false,
            "isFastest": false,
            "isCheapest": true,
            "totalPrice": "167.00",
            "currency": "SAR",
            "offerAdditionalData": {
                "thabitId": 731630277,
                "priceId": 2038572683,
                "shipperCity": {
                    "id": 26148057,
                    "name": "Riyadh",
                    "lat": 24.9319763,
                    "lng": 46.9720246094292
                },
                "receiverCity": {
                    "id": 26148057,
                    "name": "Riyadh",
                    "lat": 24.9319763,
                    "lng": 46.9720246094292
                }
            }
        },
        {
            "id": "bd26a097-ee77-4812-a40d-f36cf3f43e57",
            "offerName": null,
            "offerCode": null,
            "company": {
                "id": 1,
                "name": "أرامكس",
                "logo": "https://jahzha22.web2html5.com/assets/uploads/shipping-company/1727332648_pngwing.com (1).png",
                "description": "<div>الشحن والنقل السريع:\r\n<div>\r\n<p>تقدم أرامكس خدمات الشحن السريع الدولي والمحلي، مما يضمن تسليم الطرود في أسرع وقت ممكن.</p>\r\n</div>\r\n</div>\r\n\r\n<div>حلول التجارة الإلكترونية:\r\n<div>\r\n<p>تقدم الشركة خدمات متكاملة للتجارة الإلكترونية تشمل الشحن والتسليم وإدارة المرتجعات، مما يسهل على التجار الإلكترونيين إدارة أعمالهم.</p>\r\n</div>\r\n</div>"
            },
            "estimatedDeliveryTime": "من 2 أيام إلى5 أيام",
            "shippingType": "domestic",
            "insuranceText": "غطاء حماية شركة الشحن",
            "pickupOptions": {
                "pickupByCurrentCompany": {
                    "pickupStatus": true,
                    "PickupFee": "15.00"
                },
                "pickupByCareem": {
                    "pickupStatus": true,
                    "PickupFee": "20.00"
                }
            },
            "rewardPoints": 100,
            "isNew": false,
            "isFastest": false,
            "isCheapest": false,
            "totalPrice": "45.00",
            "currency": "SAR"
        },
        {
            "id": "9cb6fcf4-6ca5-4f53-89ee-f3ccfd754b5b",
            "offerName": "EXPRESS DOMESTIC",
            "offerCode": "N",
            "company": {
                "id": 2,
                "name": "دي اتش ال",
                "logo": "https://jahzha22.web2html5.com/assets/uploads/shipping-company/1723406837_brand-3.svg",
                "description": "<div>مجالات العمل والخدمات:\r\n<div>\r\n<p>توصيل الطرود والوثائق بسرعة على المستويين المحلي والدولي.</p>\r\n</div>\r\n</div>\r\n\r\n<div>الحضور العالمي:\r\n<div>\r\n<p>تعمل DHL في أكثر من 220 دولة ومنطقة حول العالم.</p>\r\n</div>\r\n</div>"
            },
            "estimatedDeliveryTime": null,
            "shippingType": "domestic",
            "insuranceText": "غطاء حماية شركة الشحن",
            "pickupOptions": {
                "pickupByCurrentCompany": {
                    "pickupStatus": true,
                    "PickupFee": "15.00"
                },
                "pickupByCareem": {
                    "pickupStatus": true,
                    "PickupFee": "20.00"
                }
            },
            "rewardPoints": 100,
            "isNew": false,
            "isFastest": false,
            "isCheapest": true,
            "totalPrice": "206.00",
            "currency": "SAR",
            "offerAdditionalData": {
                "pickupAndShippingTime": "2025-01-11T15:00:00 GMT+02:00"
            }
        },
        {
            "id": "86cce408-e331-4b21-a15a-a1729fe58657",
            "offerName": null,
            "offerCode": null,
            "company": {
                "id": 5,
                "name": "البريد السعودي | سبل",
                "logo": "https://jahzha22.web2html5.com/assets/uploads/shipping-company/1730012199_spl.svg",
                "description": "<p>سبل الشحن والنقل السريع:</p>"
            },
            "estimatedDeliveryTime": "من 2 أيام إلى5 أيام",
            "shippingType": "domestic",
            "insuranceText": "غطاء حماية شركة الشحن",
            "pickupOptions": {
                "pickupByCurrentCompany": {
                    "pickupStatus": false,
                    "PickupFee": null
                },
                "pickupByCareem": {
                    "pickupStatus": true,
                    "PickupFee": "20.00"
                }
            },
            "rewardPoints": 20,
            "isNew": false,
            "isFastest": true,
            "isCheapest": false,
            "totalPrice": "18.00",
            "currency": "SAR"
        },
        {
            "id": "fe52ca94-ee49-494e-a527-57bb7abbb795",
            "offerName": null,
            "offerCode": null,
            "company": {
                "id": 7,
                "name": "كريم",
                "logo": "https://jahzha22.web2html5.com/assets/uploads/shipping-company/1733066605_1725968600_من-هو-مؤسس-شركة-كريم.jpg",
                "description": "<p>كريم الشحن والنقل السريع:</p>"
            },
            "estimatedDeliveryTime": "من 2 أيام إلى6 أيام",
            "shippingType": "domestic",
            "insuranceText": "غطاء حماية شركة الشحن",
            "pickupOptions": {
                "pickupByCurrentCompany": {
                    "pickupStatus": true,
                    "PickupFee": "0.00"
                }
            },
            "rewardPoints": 20,
            "isNew": false,
            "isFastest": false,
            "isCheapest": true,
            "totalPrice": "78.00",
            "currency": "SAR"
        }
 */
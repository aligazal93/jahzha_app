part of '../view.dart';

class _StatusView extends StatelessWidget {
  const _StatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ShipmentDetailsCubit.of(context);
    final details = cubit.details!;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     _statusCard(
          //       image: 'assets/images/statue-1.png',
          //       title: 'Confirmation'.tr(),
          //       activeColor: AppColors.primary,
          //     ),
          //     _statusCard(
          //       image: 'assets/images/statue-2.png',
          //       title: 'Underway'.tr(),
          //       activeColor: AppColors.lightGray,
          //     ),
          //     _statusCard(
          //       image: 'assets/images/statue-3.png',
          //       title: 'Implemented'.tr(),
          //       activeColor: AppColors.lightGray,
          //     ),
          //   ],
          // ),
          // SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  fontSize: 14,
                  title: 'Order ID'.tr(),
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.tGray),
                    color: AppColors.whiteBk,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        title: '#${details.shipment.trackNumber}'.forceLeftToRight(),
                        fontSize: 14,
                        color: AppColors.secondary,
                      ),
                      InkWell(
                        onTap: () =>
                            Utils.copyToClipboard(details.shipment.trackNumber),
                        child: Image.asset(
                          'assets/images/copy.png',
                          width: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                AppText(
                  fontSize: 14,
                  title: 'request is done'.tr(),
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.tGray),
                    color: AppColors.whiteBk,
                  ),
                  child: AppText(
                    title: details.shipment.expectedArrivalText,
                    color: AppColors.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                AppText(
                  fontSize: 14,
                  title: 'Implementation number'.tr(),
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 14),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.tGray),
                    color: AppColors.whiteBk,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        title: '#${details.shipment.paymentTransactionID}'.forceLeftToRight(),
                        fontSize: 14,
                        color: AppColors.secondary,
                      ),
                      InkWell(
                        onTap: () => Utils.copyToClipboard(
                            details.shipment.paymentTransactionID),
                        child: Image.asset(
                          'assets/images/copy.png',
                          width: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                if (details.files.isNotEmpty) ...[
                  SizedBox(height: 14),
                  ...details.files.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title: e.type.tr(),
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 12),
                          SizedBox(
                            width: context.width(1),
                            child: QRCodeCard(
                              data: e.url,
                            ),
                          ),
                        ],
                      ),
                    );
                    // return InkWell(
                    //   onTap: () => Launcher.openUrl(e.url),
                    //   child: Container(
                    //     margin: EdgeInsets.only(bottom: 12),
                    //     padding: EdgeInsets.all(12),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(12),
                    //       border: Border.all(color: AppColors.tGray),
                    //       color: AppColors.whiteBk,
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //           child: AppText(
                    //             title: '${e.type.tr()}',
                    //             fontSize: 14,
                    //             color: AppColors.secondary,
                    //           ),
                    //         ),
                    //         Icon(
                    //           FontAwesomeIcons.qrcode,
                    //           size: 20,
                    //           color: AppColors.txtGray,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // );
                  }),
                ]
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 22),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Center(
                //         child: Image.asset('assets/images/code.png'),
                //       ),
                //       SizedBox(
                //         height: 12,
                //       ),
                //       AppText(
                //         textAlign: TextAlign.center,
                //         title:
                //             'The tracking code will appear here after the order is executed'
                //                 .tr(),
                //         fontSize: 14,
                //         color: AppColors.secondary,
                //       )
                //     ],
                //   ),
                // ),
                // QrCode(),
                // AppButton(
                //   title: 'Retrieve the request'.tr(),
                //   color: AppColors.primary,
                //   margin: EdgeInsets.symmetric(vertical: 16),
                //   constrainedAxis: Axis.horizontal,
                //   onTap: () {},
                // ),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 22),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Center(
                //         child: Image.asset('assets/images/refused.png'),
                //       ),
                //       SizedBox(
                //         height: 12,
                //       ),
                //       AppText(
                //         textAlign: TextAlign.center,
                //         title: 'Order canceled'.tr(),
                //         fontSize: 14,
                //         color: AppColors.secondary,
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusCard({
    required String image,
    required String title,
    required Color activeColor,
  }) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                border: Border.all(color: activeColor),
                borderRadius: BorderRadius.circular(120)),
            child: Image.asset(
              image,
              color: activeColor,
              width: 20,
              height: 30,
            ),
          ),
          AppText(
            title: title,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: activeColor,
          )
        ],
      ),
    );
  }
}

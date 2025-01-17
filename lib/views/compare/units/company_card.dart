part of '../view.dart';

class _CompanyCard extends StatelessWidget {
  const _CompanyCard({Key? key, required this.offer}) : super(key: key);

  final ShippingOffer offer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppNetworkImage(
              url: offer.company.logo,
              width: 64,
              height: 64,
            ),
            AppText(
              title: offer.company.name,
              fontSize: 12,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              padding: EdgeInsets.symmetric(vertical: 12),
              fontWeight: FontWeight.w700,
              color: AppColors.secondary,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (offer.isCheapest)
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.ticket,
                        color: AppColors.primary,
                        size: 12,
                      ),
                      SizedBox(width: 2),
                      AppText(
                        title: 'saving'.tr(),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                if (offer.isFastest)
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.rocket,
                        color: AppColors.blue,
                        size: 12,
                      ),
                      SizedBox(width: 2),
                      AppText(
                        title: 'fastest'.tr(),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blue,
                      ),
                    ],
                  ),
                if (offer.isNew)
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.solidStar,
                        color: AppColors.primary,
                        size: 12,
                      ),
                      SizedBox(width: 2),
                      AppText(
                        title: 'new'.tr(),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

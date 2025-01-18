part of '../view.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String initials = CachingUtils.user?.data.name?.isNotEmpty ?? false
        ? CachingUtils.user!.data.name!
            .split(' ')
            .map((word) => word[0])
            .take(2)
            .join()
        : "";
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppColors.tGray),
            borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(50),
            //   child: Image.asset(
            //     'assets/images/ma.png',
            //     fit: BoxFit.fill,
            //     width: 50,
            //     height: 50,
            //     errorBuilder: (context, error, stackTrace) => Container(
            //       width: 50,
            //       height: 50,
            //       decoration: BoxDecoration(
            //           color: AppColors.primary
            //       ),
            //       child: Icon(
            //         FontAwesomeIcons.image,
            //         size: 20,
            //         color: AppColors.white,
            //       ),
            //     ),
            //   ),
            // ),
            CachingUtils.user?.data.name == null
                ? Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.darkBlue,
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 20,
                      ),
                    ),
                  )
                : Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.darkBlue.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: Center(
                      child: AppText(
                        title: initials,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachingUtils.user?.data.name == null
                      ? SizedBox()
                      : Container(
                          width: 170,
                          child: AppText(
                            title: CachingUtils.user!.data.name!,
                            overflow: TextOverflow.ellipsis,
                            textAlign:
                                Utils.isAR ? TextAlign.right : TextAlign.left,
                            maxLines: 1,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            color: AppColors.secondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                  SizedBox(
                    height: 4,
                  ),
                  AppText(
                    title: CachingUtils.user!.data.phoneNumber == null
                        ? CachingUtils.user!.data.email!
                        : CachingUtils.user!.data.phoneNumber!,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    color: AppColors.txtGray,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            AppButton(
              title: 'Edit'.tr(),
              titleFontSize: 12,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              onTap: () {
                RouteUtils.navigateTo(AccountDetailsView());
              },
              height: 40,
            ),
            SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

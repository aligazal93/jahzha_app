part of '../view.dart';
class AboutCard extends StatelessWidget {
  const AboutCard({Key? key, required this.image, required this.title, required this.content}) : super(key: key);
  final String image,title,content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: AppColors.darkGrayBlue
          )
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Image.asset(image),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.primary.withOpacity(.3)
              ),
            ),
          ),
          SizedBox(width: 12,),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: title,
                  color: AppColors.secondary,
                  fontSize: 14,
                ),
                SizedBox(height: 8,),
                AppText(
                  title: content,
                  color: AppColors.txtGray,
                  fontSize: 12,
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

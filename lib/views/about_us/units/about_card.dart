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
              width: 50,
              height: 50,
              padding: EdgeInsets.all(8),
              child: AppNetworkImage(
                url: image,
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.primary.withOpacity(.3)
              ),
            ),
          ),
          SizedBox(width: 8,),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: title,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  color: AppColors.secondary,
                  fontSize: 14,
                ),
                Html(data: content,style: {
                  "p": Style(
                      fontSize: FontSize(12),
                      padding: HtmlPaddings.zero,
                      color: AppColors.txtGray
                  ),
                },),
              ],
            ),
          )
        ],
      ),
    );
  }
}

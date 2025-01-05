part of '../view.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({Key? key, required this.image, required this.title, required this.onTap}) : super(key: key);
  final String image,title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: AppText(
        title: title,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        textAlign: Utils.isAR ? TextAlign.right : TextAlign.left,

      ),
      leading: Image.asset('assets/images/${image}.png',color: AppColors.lightGray,width: 28,),
      trailing:Icon( Utils.isAR ? FontAwesomeIcons.chevronLeft : FontAwesomeIcons.chevronRight ,size: 18,color: AppColors.secondary,),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/views/send_shipments/cubit/cubit.dart';
import 'package:jahzha_app/views/send_shipments/cubit/states.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class BoxTypeCard extends StatelessWidget {
  const BoxTypeCard({Key? key, this.onTap, required this.index, required this.image, required this.type}) : super(key: key);
  final Function(int)? onTap;
  final int index;
  final String image , type;
  @override
  Widget build(BuildContext context) {
    final cubit = SendShipmentCubit.of(context);
    final isActive = index == cubit.currentIndex;
    return Expanded(
      child: InkWell(
        onTap: () => cubit.toggleTab(index),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 12,horizontal: 4),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color:isActive ? AppColors.primary : AppColors.tGray
              )
          ),
          child: Column(
            children: [
              Image.asset('assets/images/${image}.png',
              color: isActive ? AppColors.primary : AppColors.txtGray,
              ),
              AppText(
              title: type,
              fontWeight: FontWeight.w700,
              fontSize: 10,
              padding: EdgeInsets.symmetric(vertical: 8),
              color: isActive ? AppColors.primary : AppColors.txtGray,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/views/auth/login/cubit.dart';
import 'package:jahzha_app/views/auth/login/units/email_form.dart';
import 'package:jahzha_app/views/auth/login/units/mobile_form.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with SingleTickerProviderStateMixin  {
  late TabController _tabController;
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  final GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              height: Utils.sizeFromHeight(2.5),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/logo-w.png'),
                  Container(
                    margin: EdgeInsets.only(bottom: 0,top: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        0.0,
                      ),
                    ),
                    child: TabBar(
                      dividerColor: AppColors.white,
                      controller: _tabController,
                      labelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: AppColors.primary,
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      unselectedLabelColor: Colors.red,
                      indicatorPadding: EdgeInsets.zero,
                      indicatorWeight: 7,
                      tabs: [
                        Tab(
                          child: AppText(
                            title: 'Via mobile'.tr(),
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Tab(
                          child: AppText(
                            title: 'By email'.tr(),
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<AuthCubit,AuthStates>(
              builder: (context, state) {
                final cubit = AuthCubit.of(context);
                return Form(
                  key: cubit.formKey,
                  child: Container(
                    height: Utils.sizeFromHeight(1.7),
                    child: TabBarView(
                      controller: _tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                          child: Container(
                              child: ViaMobileForm()
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                          child: Container(
                              child: ViaEmailForm()
                          ),
                        )

                      ],
                    ),
                  ),
                );
              },
            )
          ],
        )
      ),
    );
  }
}
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_dialog.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/helpers/utils.dart';
import '../../core/route_utils/route_utils.dart';
import '../../widgets/app_loading_indicator.dart';
import '../navbar/view.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key, required this.url}) : super(key: key);
  final String url;

  Future<void> show() {
    return RouteUtils.navigateTo(this);
  }

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  WebViewController? controller;
  bool absorbView = false;
  bool hasPageLoaded = false;

  @override
  void initState() {
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (_) {
          hasPageLoaded = false;
          setState(() {});
        },
        onPageFinished: (url) async {
          await controller?.runJavaScript(getJSCodeToHideHeader());
          dynamic result = await controller!
              .runJavaScriptReturningResult('document.body.innerText');
          if (result.toString().contains('message') &&
              result.toString().contains('status_code')) {
            var decodedData = jsonDecode(result.toString());
            while (decodedData is String) {
              decodedData = jsonDecode(decodedData);
            }
            final isSuccess = decodedData['status_code'].toString() == '200';
            final message = decodedData['message'] ?? 'something went wrong';
            _PaymentResultDialog(
              message: message,
              isSuccess: isSuccess,
            ).show();
          } else {
            hasPageLoaded = true;
            setState(() {});
          }
        },
        onNavigationRequest: (request) async {
          return NavigationDecision.navigate;
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    Future.delayed(Duration.zero, () async {
      await controller!.loadRequest(
        Uri.parse(widget.url),
      );
      setState(() {});
    });
    super.initState();
  }

  static String getJSCodeToHideHeader() {
    return '''
          (function() {
            var mainHeader = document.querySelector('.main-header');
            if (mainHeader) {
              mainHeader.style.display = 'none';
            }
            var header = document.querySelector('.header');
            if (header) {
              header.style.display = 'none';
            }
            var road = document.querySelector('.road');
            if (road) {
              road.style.display = 'none';
            }
            var footer = document.querySelector('.footer');
            if (footer) {
              footer.style.display = 'none';
            }
            var whatsapp = document.querySelector('.whatsapp');
            if (whatsapp) {
              whatsapp.style.display = 'none';
            }
          })();
          ''';
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorbView,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'checkout'.tr(),
        ),
        body: Builder(builder: (context) {
          if (controller == null || !hasPageLoaded) {
            return AppLoadingIndicator();
          }
          return WebViewWidget(controller: controller!);
        }),
      ),
    );
  }
}

class _PaymentResultDialog extends StatelessWidget {
  const _PaymentResultDialog({
    Key? key,
    required this.message,
    required this.isSuccess,
  }) : super(key: key);

  final String message;
  final bool isSuccess;

  Future<void> show() {
    return AppDialog.show(
      child: this,
      dismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            Utils.getAssetPNGPath(isSuccess ? 'menu-2' : 'info'),
            color: isSuccess ? AppColors.green : AppColors.red,
            width: 120,
            height: 120,
          ),
          SizedBox(height: 8),
          AppText(
            title: message,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
            height: 24,
            fontSize: 16,
          ),
          SizedBox(height: 24),
          AppButton(
            title: 'Home'.tr(),
            height: 48,
            onTap: () => RouteUtils.navigateAndPopAll(NavBarView()),
            constrainedAxis: Axis.horizontal,
            titleFontSize: 16,
          ),
          if (isSuccess) ...[
            SizedBox(height: 8),
            AppButton.outline(
              title: 'My shipments'.tr(),
              constrainedAxis: Axis.horizontal,
              height: 48,
              titleFontSize: 14,
              onTap: () => RouteUtils.navigateAndPopAll(NavBarView(
                initialViewIndex: 1,
              )),
            ),
          ],
        ],
      ),
    );
  }
}

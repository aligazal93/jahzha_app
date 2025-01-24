import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/route_utils/route_utils.dart';
import '../../widgets/app_loading_indicator.dart';
import '../../widgets/snack_bar.dart';
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
        onPageFinished: (url) async {
          hasPageLoaded = false;
          setState(() {});
          await controller?.runJavaScript(getJSCodeToHideHeader());
          dynamic result = await controller!
              .runJavaScriptReturningResult('document.body.innerText');
          if (result.toString().contains('message') &&
              result.toString().contains('status_code')) {
            final decodedData = jsonDecode(result);
            final isSuccess = decodedData['status_code'].toString() == '200';
            final message = decodedData['message'] ?? 'something went wrong';
            showSnackBar(
              message,
              errorMessage: !isSuccess,
            );
            RouteUtils.navigateAndPopAll(NavBarView());
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
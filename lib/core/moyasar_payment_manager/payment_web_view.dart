// import 'package:flutter/material.dart';
// import 'package:hasalt_app/core/helpers/utils.dart';
// import 'package:hasalt_app/widgets/app_loading_indicator.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class PaymentWebviewView extends StatefulWidget {
//   const PaymentWebviewView({
//     Key? key, required this.url,
//     required this.paymentCubit,
//     required this.onPayment,
//   }) : super(key: key);
//
//   final dynamic paymentCubit;
//   final String url;
//   final Function(String paymentID, String status, String message) onPayment;
//   @override
//   State<PaymentWebviewView> createState() => _PaymentWebviewViewState();
// }
//
// class _PaymentWebviewViewState extends State<PaymentWebviewView> {
//   WebViewController? controller;
//
//   @override
//   void initState() {
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {},
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.contains('id') &&
//                 request.url.contains('amount') &&
//                 request.url.contains('status')) {
//               final params = Utils.getParamFromURL(request.url);
//               widget.onPayment(
//                 params['id'],
//                 params['status'],
//                 params['message'],
//               );
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.url));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (controller == null) {
//       return Scaffold(
//         appBar: AppBar(),
//         body: AppLoadingIndicator(),
//       );
//     }
//     return WebViewWidget(
//       controller: controller!,
//     );
//   }
// }
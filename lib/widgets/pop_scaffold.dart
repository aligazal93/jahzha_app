import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';

import '../core/helpers/utils.dart';
import 'app_text.dart';

class KeyboardPopScaffold extends StatefulWidget {
  const KeyboardPopScaffold({super.key, required this.child});

  final Widget child;

  @override
  State<KeyboardPopScaffold> createState() => _KeyboardPopScaffoldState();
}

class _KeyboardPopScaffoldState extends State<KeyboardPopScaffold>
    with WidgetsBindingObserver {
  late StreamSubscription<InternetConnectionStatus> _stream;
  bool noConnection = false;
  bool ignoreStatus = true;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    final checker = InternetConnectionChecker.createInstance(
      requireAllAddressesToRespond: false,
      slowConnectionConfig: SlowConnectionConfig(
        enableToCheckForSlowConnection: false,
      ),
    );
    _stream = checker.onStatusChange.listen((event) async {
      if (ignoreStatus) {
        ignoreStatus = false;
        noConnection = !(await checker.hasConnection);
        rebuild();
        return;
      }
      noConnection = event == InternetConnectionStatus.disconnected;
      rebuild();
    });
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Future.delayed(Duration(milliseconds: 500), () {
        _stream.resume();
      });
    } else {
      _stream.pause();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void rebuild() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Utils.dismissKeyboard,
      child: Stack(
        children: [
          widget.child,
          if (noConnection)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Scaffold(
                backgroundColor: Color(0xFFE5F2FF),
                body: Bounce(
                  curve: Curves.fastLinearToSlowEaseIn,
                  infinite: true,
                  duration: Duration(milliseconds: 3000),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        Utils.getAssetPNGPath('no_internet'),
                      ),
                      SizedBox(height: 24.height),
                      AppText(
                        title: Utils.isAR
                            ? 'لا يوجد اتصال بالانترنت!'
                            : 'No Internet Connection!',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.font,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:app/components/palette.dart';
import 'package:app/models/user_model.dart';
import 'package:app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:collection';
import 'dart:core';
import 'dart:math';
import 'dart:developer' as dev;
import 'dart:io' show Platform;

import '../services/push_service.dart';
import '../widgets/buttons.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final UserModel customer;
  final String? labourer;
  final String bookingId;

  const WebViewScreen({
    super.key,
    required this.url,
    required this.customer,
    this.labourer,
    required this.bookingId,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late String _url = '';
  final GlobalKey webViewKey = GlobalKey();
  late String _transactionRef = '';

  InAppWebViewController? webViewControllerNative;
  late WebViewXController webviewController;

  Size get screenSize => MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();
    _url = widget.url;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
          // actions: [
          //   GestureDetector(
          //     onTap: () {
          //       showSuccessDialog(context);
          //     },
          //     child: Icon(
          //       Icons.check,
          //       color: Colors.green,
          //     ),
          //   ),
          //   SizedBox(width: 10),
          //   GestureDetector(
          //     onTap: () {
          //       showFailDialog(context);
          //     },
          //     child: Icon(
          //       Icons.not_interested,
          //       color: Colors.red,
          //     ),
          //   ),
          //   SizedBox(width: 20),
          // ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey,
                child: Platform.isAndroid || Platform.isIOS
                    ? InAppWebView(
                        key: webViewKey,
                        initialUrlRequest: URLRequest(url: Uri.parse(_url)),
                        initialUserScripts:
                            UnmodifiableListView<UserScript>([]),
                        onWebViewCreated: (controller) async {
                          webViewControllerNative = controller;
                          print(await controller.getUrl());
                        },
                        onLoadStart: (controller, url) async {
                          dev.log(url?.path ?? '');
                          if (url?.path.indexOf('/api/payfast/success') != -1) {
                            showSuccessDialog(context);
                          } else if (url?.path.indexOf('/api/payfast/fail') !=
                              -1) {
                            showFailDialog(context);
                          }
                        },
                        shouldOverrideUrlLoading:
                            (controller, navigationAction) async {
                          var uri = navigationAction.request.url!;
                          return NavigationActionPolicy.ALLOW;
                        },
                        onLoadStop: (controller, url) async {
                          dev.log(url?.path ?? '');
                          if (url?.path.indexOf('/api/payfast/success') != -1) {
                            if (widget.labourer != null) {
                              sendNotificationToPlayer(
                                  widget.labourer!,
                                  'Booking Paid',
                                  '${widget.customer.fullName} has paid for the booking.');
                            } else {}
                            showSuccessDialog(context);
                          } else if (url?.path.indexOf('/api/payfast/fail') !=
                              -1) {
                            showFailDialog(context);
                          }
                        },
                        onConsoleMessage: (controller, consoleMessage) {
                          print(consoleMessage);
                        },
                      )
                    : WebViewX(
                        key: const ValueKey('webviewx'),
                        initialContent: _url,
                        initialSourceType: SourceType.url,
                        height: screenSize.height / 2,
                        width: min(screenSize.width * 0.8, 1024),
                        onWebViewCreated: (controller) =>
                            webviewController = controller,
                        onPageStarted: (src) => debugPrint(
                            'A new page has started loading: $src\n'),
                        onPageFinished: (src) => {
                          // log('C${src}');
                          // if (src.indexOf('/api/paygate/return/fail') != -1)
                          //   {
                          //     // SHOW FAIL MESSAGE
                          //   }
                          // else if (src.indexOf('/api/paygate/return/success') != -1)
                          //   {
                          //     // SHOW SUCCESS MESSAGE AND REFRESH BOOKINGS PAGE MAYBE?
                          //     // OR IT COULD BE HERE
                          //   }
                        },
                        webSpecificParams: const WebSpecificParams(
                          printDebugInfo: true,
                        ),
                        mobileSpecificParams: const MobileSpecificParams(
                          androidEnableHybridComposition: true,
                        ),
                        navigationDelegate: (navigation) {
                          debugPrint(
                              'nav: $navigation.content.sourceType.toString()');
                          return NavigationDecision.navigate;
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showSuccessDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'THANK YOU',
                    style: TextStyle(
                      color: Palette.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Your payment was unsuccessful.'),
                  Text('Press OK to go back to your bookings.'),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); //pop dialog
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    },
                    child: smallGreenButton(label: 'OK'),
                  ),
                ],
              ),
            ),
          );
        },
      );

  showFailDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'OH NO',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Your payment failed.'),
                  Text('Press OK to go back to your bookings.'),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); //pop dialog
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    },
                    child: smallGreenButton(label: 'OK'),
                  ),
                ],
              ),
            ),
          );
        },
      );
}

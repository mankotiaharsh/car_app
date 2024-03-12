import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BenzView extends StatefulWidget {
  const BenzView({super.key});

  @override
  State<BenzView> createState() => _BenzViewState();
}

class _BenzViewState extends State<BenzView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(Uri.parse('https://www.carwale.com/mercedes-benz-cars/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RabbitInfoPageScreen extends StatefulWidget {
  const RabbitInfoPageScreen({super.key});

  @override
  State<RabbitInfoPageScreen> createState() => _RabbitInfoPageScreenState();
}

class _RabbitInfoPageScreenState extends State<RabbitInfoPageScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(Uri.parse('https://www.carwale.com/bmw-cars/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}

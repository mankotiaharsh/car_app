// https://forms.gle/R6gYv2KWRWC8QEu5A
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleFormPage extends StatefulWidget {
  const GoogleFormPage({super.key});

  @override
  State<GoogleFormPage> createState() => _GoogleFormPage();
}

class _GoogleFormPage extends State<GoogleFormPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(Uri.parse('https://forms.gle/AmFbRjUnGtzkKq2D8'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}

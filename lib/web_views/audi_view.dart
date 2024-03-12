import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AudiViewPage extends StatefulWidget {
  const AudiViewPage({super.key});

  @override
  State<AudiViewPage> createState() => _AudiViewPageState();
}

class _AudiViewPageState extends State<AudiViewPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(Uri.parse('https://www.audi.in/in/web/en.html'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}

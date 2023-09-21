// main.dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebViewEx(),
    );
  }
}

class WebViewEx extends StatefulWidget {
  const WebViewEx({Key? key}) : super(key: key);

  @override
  _WebViewExState createState() => _WebViewExState();
}

class _WebViewExState extends State<WebViewEx> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://dribbble.com/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
        ),
      ),
    );
  }
}

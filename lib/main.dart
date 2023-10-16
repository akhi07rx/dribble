import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WebViewEx(),
  ));
}

class WebViewEx extends StatefulWidget {
  const WebViewEx({Key? key}) : super(key: key);

  @override
  State<WebViewEx> createState() => _WebViewExState();
}

class _WebViewExState extends State<WebViewEx> {
  late Future<WebViewController> _controllerFuture;

  @override
  void initState() {
    super.initState();
    _controllerFuture = _initWebViewController();
  }

  Future<WebViewController> _initWebViewController() async {
    WebViewController controller = WebViewController();
    await controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    await controller.loadRequest(Uri.parse('https://dribbble.com/'));
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<WebViewController>(
          future: _controllerFuture,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return WebViewWidget(controller: snapshot.data!);
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading web view'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

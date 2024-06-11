import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  static const routeName = "/webview_page";
  final String url;
  const WebViewPage({super.key, required this.url});git i

  @override
  Widget build(BuildContext context) {
    final myController = WebViewController()..loadRequest(Uri.parse(url));
    
    return Scaffold(
      appBar: AppBar(
        title:const  Text("Web View"),
      ),
      body: WebViewWidget(controller: myController),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Webview extends StatefulWidget {
  final String url;
  Webview({this.url});
  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  Completer<WebViewController> _completer =Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        //backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News"),
            Text(
              "Store",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: Icon(Icons.ac_unit),
            ),
          )
        ],
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.url,
          onWebViewCreated: ((WebViewController webviewcontroller)
          {
            _completer.complete(webviewcontroller);
          }),
        )
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewNews extends StatelessWidget {
  String url;
  String urlImage;
  String title;
  String description;
  String author;
  WebViewNews(this.url,this.urlImage,this.title,this.description,this.author);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(title),

        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .padding
                  .top,
            ),
            Expanded(
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: url,
              ),
            ),

          ],
        ));
  }
}
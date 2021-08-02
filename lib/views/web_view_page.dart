import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String? url;
  final String? heroTag;
  final String? sourceName;

  const WebViewPage({Key? key, this.url, this.heroTag, this.sourceName}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  @override
  void dispose() {
    Loader.hide();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.heroTag.toString(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF50CB93),
          title: Text('Source : ${widget.sourceName}'),
        ),
        body: WebView(
          initialUrl: widget.url,
          onProgress: (value) {
            print(value);
            if (value < 100) {
              Loader.show(context,
                  progressIndicator: Center(
                      child: CircularProgressIndicator()));
            } else {
              Loader.hide();
            }
          },
        ),
      ),
    );
  }
}

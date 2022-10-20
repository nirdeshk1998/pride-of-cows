

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';


class FaqAndLinksWebView extends ConsumerWidget{
  const FaqAndLinksWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return Scaffold(
      body:  WebView(
        zoomEnabled: true,
        initialUrl: 'https://dev.heptawork.com/pocstaging/faqs',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

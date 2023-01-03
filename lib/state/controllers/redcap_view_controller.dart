import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RedCapViewController extends WebViewController {
  RedCapViewController(String userId) {
    WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://redcap.mcw.edu/surveys/?s=FTDNM8JEF9NE4EA9&app_id=$userId&pref_language=1'));
  }
}

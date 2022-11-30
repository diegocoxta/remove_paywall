import 'dart:async';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Logic {
  static void open12ftUrl(String? url, {Function(String?)? cb}) async {
    if (url == null) {
      return;
    }

    if (cb != null) {
      cb(url);
    }

    await launchUrlString(
      "https://12ft.io/$url",
      mode: LaunchMode.externalApplication,
    );
  }

  static StreamSubscription subscribeShareIntent(Function(String? value)? cb) {
    ReceiveSharingIntent.getInitialText()
        .then((value) => open12ftUrl(value, cb: cb));
    return ReceiveSharingIntent.getTextStream()
        .listen((value) => open12ftUrl(value, cb: cb));
  }
}

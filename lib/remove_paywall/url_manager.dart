import 'package:url_launcher/url_launcher_string.dart';

class UrlManager {
  static Future<void> openUrl(String? url) async {
    if (url == null) {
      return;
    }

    await launchUrlString("https://12ft.io/$url",
        mode: LaunchMode.externalApplication);
  }
}

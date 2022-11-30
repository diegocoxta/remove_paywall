import 'dart:async';
import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:url_launcher/url_launcher_string.dart';

import './homepage.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  StreamSubscription? _intentDataStreamSubscription;
  String? url;

  void openUrl(String? value) async {
    if (value == null) {
      return;
    }

    setState(() {
      url = value;
    });

    await launchUrlString("https://12ft.io/$value",
        mode: LaunchMode.externalApplication);
  }

  @override
  void initState() {
    super.initState();
    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen(openUrl);

    ReceiveSharingIntent.getInitialText().then(openUrl);
  }

  @override
  void dispose() {
    super.dispose();
    _intentDataStreamSubscription!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(url: url);
  }
}

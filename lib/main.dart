import 'dart:async';
import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import './remove_paywall/remove_paywall.dart';

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
  String? _sharedUrl;

  void saveUrl(String? value) async {
    setState(() {
      _sharedUrl = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen(saveUrl);

    ReceiveSharingIntent.getInitialText().then(saveUrl);
  }

  @override
  void dispose() {
    super.dispose();
    _intentDataStreamSubscription!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: RemovePaywall(url: _sharedUrl),
      ),
    );
  }
}

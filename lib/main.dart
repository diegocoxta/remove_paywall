import 'dart:async';
import 'package:flutter/material.dart';

import 'view.dart';
import 'logic.dart';

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

  @override
  void initState() {
    super.initState();
    _intentDataStreamSubscription = Logic.subscribeShareIntent((String? value) {
      setState(() {
        url = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _intentDataStreamSubscription!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return View(url: url);
  }
}

import 'package:flutter/material.dart';
import './url_manager.dart';

class RemovePaywall extends StatelessWidget {
  final String? url;

  const RemovePaywall({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UrlManager.openUrl(url);

    return const Center(
      child: Text(
        "Open your blocked url in your favorite browser and then share with Remove Paywall to read freely.",
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 32, letterSpacing: -1.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  final String? url;

  const HomePage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              "Open your blocked URL in your favorite browser and share it with Remove Paywall to read freely.",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32,
                letterSpacing: -1.0,
              ),
            ),
            Text("Last opened url: $url"),
          ],
        ),
        TextButton(
          onPressed: () async => await launchUrlString("https://12ft.io"),
          child: const Text("Powered by 12ft.io"),
        )
      ],
    );
  }
}

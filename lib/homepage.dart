import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  final String? url;

  const HomePage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: RichText(
                text: TextSpan(
                    text:
                        "Open your blocked URL in your favorite browser and share it with Remove Paywall to read freely.",
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      letterSpacing: -1.0,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: url != null ? "\n\nLast url opened: " : "",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: url,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrlString(
                                "https://12ft.io/$url",
                                mode: LaunchMode.externalApplication,
                              ),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () async => await launchUrlString(
              "https://12ft.io",
              mode: LaunchMode.externalApplication,
            ),
            child: const Text(
              "Powered by 12ft.io",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}

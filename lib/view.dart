import 'package:flutter/material.dart';

import 'logic.dart';

class View extends StatelessWidget {
  const View({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            const Expanded(
              flex: 9,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                    child: Text(
                  "Open your blocked URL in your favorite browser and share it with Remove Paywall to read freely.",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    letterSpacing: -1.0,
                    color: Colors.black,
                  ),
                )),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () async => Logic.open12ftUrl(""),
                child: const Text(
                  "Powered by 12ft.io",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutWeb extends StatefulWidget {
  final str;

  const AboutWeb({
    Key? key,
    this.str,
  }) : super(key: key);

  @override
  _AboutWebState createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "About Web",
              style: TextStyle(fontSize: 40.0),
            ),
            Text(
              "Argument ${widget.str.toString()}",
              style: TextStyle(fontSize: 40.0),
            ),
            MaterialButton(
              color: Colors.cyan,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Go back",
                style: TextStyle(fontSize: 40.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

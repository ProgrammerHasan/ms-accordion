import 'package:flutter/material.dart';
import 'package:ms_accordion/ms_accordion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MsAccordion(
          titleChild: ListTile(
            leading: Transform(
              transform: Matrix4.translationValues(-12, 0.0, 0.0),
              child: Text('Programmer Hasan'),
            ),
            title: Transform(
              transform: Matrix4.translationValues(-12, 0.0, 0.0),
              child: Text('Accordion'),
            ),
          ),
          showAccordion: false,
          margin: const EdgeInsets.all(0),
          expandedTitleBackgroundColor: Colors.blueGrey.withOpacity(0.3),
          collapsedTitleBackgroundColor: Colors.white10,
          contentBackgroundColor: Colors.white,
          contentChild: Column(
            children: <Widget>[
              // your children
            ],
          ),
        ),
      ),
    );
  }
}

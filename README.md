# MsAccordion

This is a flutter accordion package written in dart for flutter developers.

## Getting Started

# ms_accordion

A new Flutter package that provide already made MsAccordian

##Usage

[Example] (https://github.com/ProgrammerHasan/ms-accordion/blob/master/example/msAccordian.dart)

To use this package :
*add the dependency to your [pubspec.yaml] file

```yaml
    dependencies:
        flutter:
            sdk : flutter
        ms_accordion:
```

```dart
    //...
    Example Usage
    //...

    import 'package:flutter/material.dart';
    import 'package:ms_accordion/ms_accordion.dart';
    
    class ExampleMSAccordian extends StatefulWidget {
      @override
      _ExampleMSAccordianState createState() => _ExampleMSAccordianState();
    }
    
    class _ExampleMSAccordianState extends State<ExampleMSAccordian> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('Accordian Example')),
          body: MsAccordion(
            titleChild: ListTile(
              leading:Transform(
                transform: Matrix4.translationValues(-12, 0.0, 0.0),
                child: Text('Programmer Hasan'),
              ),
              title:Transform(
                transform: Matrix4.translationValues(-12, 0.0, 0.0),
                child: Text('Accordian'),
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
        );
      }
    }

```


## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

import 'package:flutter/material.dart';
import 'package:tp1/screen/Acueil .dart';
import 'package:tp1/screen/ContactJson.dart';
import 'package:tp1/screen/ContactUrl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Acueil(),
        '/contactJson': (context) => ContactJson(),
        '/contactUrl': (context) => ContactUrl(),
      },
    );
  }
}

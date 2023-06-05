import 'package:flutter/material.dart';
import 'Menu.dart';

class Acueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CONTACT"),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(child: Text("Contact")),
              PopupMenuItem(child: Text("Appel")),
            ],
          ),
        ],
      ),
      body: Center(child: Text("WELCOM")),
      drawer: Menu(),
    );
  }
}

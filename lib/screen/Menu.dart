import 'package:flutter/material.dart';
import 'package:tp1/screen/ContactJson.dart';
import 'package:tp1/screen/ContactUrl.dart';

class Menu extends StatelessWidget {
  void navigateToContactJson(BuildContext context) {
    Navigator.pushNamed(context, '/contactJson');
  }

  void navigateToContactUrl(BuildContext context) {
    Navigator.pushNamed(context, '/contactUrl');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
  child: Text('DRAWER', style: TextStyle(color: Colors.white)),
  decoration: BoxDecoration(
    color: Colors.blue,
  ),
),
          ListTile(
            title: Text("Contact Json Local"),
            leading: Icon(Icons.contacts),
            onTap: () => navigateToContactJson(context),
          ),
          ListTile(
            title: Text("Contact Json Url"),
            leading: Icon(Icons.contacts),
            onTap: () => navigateToContactUrl(context),
          ),
          ListTile(
            title: Text("Parameter"),
            leading: Icon(Icons.settings),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

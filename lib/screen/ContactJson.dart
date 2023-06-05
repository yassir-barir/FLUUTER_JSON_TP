import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tp1/model/Contact.dart';

class ContactJson extends StatefulWidget {
  @override
  State<ContactJson> createState() => _ContactJsonState();
}

class _ContactJsonState extends State<ContactJson> {
  List<Contact> contacts = [];
  List<Contact> filteredContacts = [];

  TextEditingController searchController = TextEditingController();

  Future<void> loadJson() async {
    final jsonString = await rootBundle.loadString('lib/provider/contact.json');
    final jsonData = json.decode(jsonString);

    setState(() {
      contacts = List<Contact>.from(jsonData.map((data) {
        return Contact.fromJson(data);
      }));
      filteredContacts = contacts;
    });
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  void filterContacts(String query) {
    List<Contact> filteredList = [];
    filteredList.addAll(contacts);

    if (query.isNotEmpty) {
      filteredList.retainWhere((contact) =>
          contact.nom.toLowerCase().contains(query.toLowerCase()));
    }

    setState(() {
      filteredContacts = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterContacts(value);
              },
              decoration: InputDecoration(
                labelText: 'Search by Name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = filteredContacts[index];
                return ListTile(
                  title: Text(contact.nom),
                  subtitle: Text(contact.prenom),
                  trailing: Text(contact.numero),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

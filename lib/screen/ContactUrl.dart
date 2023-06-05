import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactUrl extends StatefulWidget {
  @override
  State<ContactUrl> createState() => _ContactUrlState();
}

class _ContactUrlState extends State<ContactUrl> {
  List<dynamic> contacts = [];
  List<dynamic> filteredContacts = [];

  TextEditingController searchController = TextEditingController();

  Future<void> fetchContacts() async {
    var url = Uri.parse('https://my-json-server.typicode.com/yassir-barir/demo/db');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        var jsonData = jsonDecode(response.body);
        contacts = jsonData['contacts'];
        filteredContacts = contacts;
      });
    } else {
      // Error occurred while fetching contacts
      print('Failed to fetch contacts. Error: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  void filterContacts(String query) {
    List<dynamic> filteredList = [];
    filteredList.addAll(contacts);

    if (query.isNotEmpty) {
      filteredList.retainWhere((contact) =>
          contact['nom'].toLowerCase().contains(query.toLowerCase()));
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
                  title: Text(contact['nom']),
                  subtitle: Text(contact['prenom']),
                  trailing: Text(contact['numero']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

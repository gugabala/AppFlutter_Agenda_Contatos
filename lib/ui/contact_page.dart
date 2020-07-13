import 'package:br/helper/contact_helper.dart';
import 'package:flutter/material.dart';

class ContatctPage extends StatefulWidget {
  final Contact contact;

  ContatctPage({this.contact});

  @override
  _ContatctPageState createState() => _ContatctPageState();
}

class _ContatctPageState extends State<ContatctPage> {
  Contact _editedContact;

  @override
  void initState() {
    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_editedContact.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
        backgroundColor: Colors.red,
      ),
    );
  }
}

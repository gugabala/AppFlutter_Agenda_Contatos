import 'dart:io';

import 'package:br/helper/contact_helper.dart';
import 'package:flutter/material.dart';

class ContatctPage extends StatefulWidget {
  final Contact contact;

  ContatctPage({this.contact});

  @override
  _ContatctPageState createState() => _ContatctPageState();
}

class _ContatctPageState extends State<ContatctPage> {
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  Contact _editedContact;
  bool _userEdited;

  @override
  void initState() {
    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());
      _nameController.text=_editedContact.name;
      _emailController.text==_editedContact.email;
      _phoneController.text==_editedContact.phone;
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: _editedContact.img != null
                          ? FileImage(File(_editedContact.img))
                          : AssetImage("images/person.png"),
                    )),
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text) {
                _userEdited = true;
                setState(() {
                  _editedContact.name = text;
                });
              },
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (text) {
                _userEdited = true;
                _editedContact.email = text;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: "Telefone"),
              onChanged: (text) {
                _userEdited = true;
                _editedContact.phone = text;
              },
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:br/helper/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    super.initState();
/*    Contact c = Contact();
    c.name = "Guga";
    c.email = "gugabala@gmail.com";
    c.phone = "3222222222";
    c.img = "img.pmg";
    helper.saveContact(c);*/

    helper.getAllContact().then((list) {
      print(list);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

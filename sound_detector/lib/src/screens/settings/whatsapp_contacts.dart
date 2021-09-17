import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class WhatsAppContacts extends StatelessWidget {
  final TextEditingController whatsapp1 = TextEditingController();
  final TextEditingController whatsapp2 = TextEditingController();
  final TextEditingController whatsapp3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp Contacts"),
      ),
      body: ListView(children: [
        Text("WhatsApp Contact 1: "),
        TextField(
          controller: whatsapp1,
        ),
        Text("WhatsApp Contact 2: "),
        TextField(
          controller: whatsapp2,
        ),
        Text("WhatsApp Contact 3: "),
        TextField(
          controller: whatsapp3,
        ),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Submit")),
      ]),
    );
  }
}

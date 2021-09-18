import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sound_detector/src/helpers/contactTextField.dart';
import 'package:sound_detector/src/helpers/iconTextField.dart';

class WhatsAppContacts extends StatelessWidget {
  final TextEditingController whatsapp1 = TextEditingController();
  final TextEditingController whatsapp2 = TextEditingController();
  final TextEditingController whatsapp3 = TextEditingController();

  final ContactTextField contactTextField = ContactTextField();

  WhatsAppContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency Contacts",
            style: TextStyle(color: Colors.black)),
        elevation: 1,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              children: [
                contactTextField.contactTextField(
                  context,
                  whatsapp2,
                  "Emergency Contact 1",
                  "621034569",
                ),
                contactTextField.contactTextField(
                  context,
                  whatsapp2,
                  "Emergency Contact 2 (Optional)",
                  "621034569",
                ),
                contactTextField.contactTextField(
                  context,
                  whatsapp3,
                  "Emergency Contact 3 (Optional)",
                  "621034569",
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Update"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

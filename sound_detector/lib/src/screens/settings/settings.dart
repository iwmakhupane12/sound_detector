import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sound_detector/src/controllers/settingsController.dart';
import 'package:sound_detector/src/models/settingsModel.dart';
import 'package:sound_detector/src/screens/settings/whatsapp_contacts.dart';

class Settings {
  final SettingsModel settingsModel = SettingsModel();
  final SettingsController settingsController = Get.find<SettingsController>();

  final String saveRecTitle = "Save recording files";
  final String saveRecSubtitle =
      "Save recordings after finishing the recording.";
  final String sendWhatsAppTitle = "Send recording";
  final String sendWhatsAppSubtitle = "Send recording to saved contacts";
  final String personalizeText = "Send text message";

  Widget settings() {
    return Column(
      children: [
        const Text(
          "Add Emergency Contacts",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        InkWell(
            onTap: () {
              Get.to(() => WhatsAppContacts());
            },
            child: const ListTile(
              title: Text("Click to Add Contacts"),
              subtitle: Text(
                  "Text message that will be sent to the emergency contact details"),
            )),
        InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("Personalize message text sent"),
              subtitle: Text(
                  "Text message that will be sent to the emergency contact details"),
            )),
        const Divider(),
        InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("Privacy Policy"),
            )),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

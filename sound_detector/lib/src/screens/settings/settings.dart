import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sound_detector/src/controllers/settingsController.dart';
import 'package:sound_detector/src/models/settingsModel.dart';
import 'package:sound_detector/src/screens/settings/whatsapp_contacts.dart';

class Settings extends StatelessWidget {
  final SettingsModel settingsModel = new SettingsModel();
  final SettingsController settingsController = Get.find<SettingsController>();

  final String saveRecTitle = "Save recording files";
  final String saveRecSubtitle =
      "Save recordings after finishing the recording.";
  final String sendWhatsAppTitle = "Send recording";
  final String sendWhatsAppSubtitle =
      "Send recording to saved WhatsApp contacts";
  final String personalizeText = "Send text message";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              GetBuilder<SettingsController>(
                builder: (_) => CheckboxListTile(
                  title: Text(saveRecTitle),
                  subtitle: Text(saveRecSubtitle),
                  value: settingsController.saveRecording,
                  onChanged: (value) => settingsController.toggleSave(value),
                ),
              ),
              Divider(),
              Text(
                "WhatsApp Settings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              InkWell(
                  onTap: () {
                    Get.to(() => WhatsAppContacts());
                  },
                  child: ListTile(
                    title: Text("WhatsApp Emergency Contacts"),
                    subtitle: Text(
                        "Text message that will be sent to the emergency contact details"),
                  )),
              GetBuilder<SettingsController>(
                builder: (_) => CheckboxListTile(
                  title: Text(sendWhatsAppTitle),
                  subtitle: Text(sendWhatsAppSubtitle),
                  value: settingsController.sendRecording,
                  onChanged: (value) => settingsController.toggleSend(value),
                ),
              ),
              InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text("Personalize WhatsApp text"),
                    subtitle: Text(
                        "Text message that will be sent to the emergency contact details"),
                  )),
              GetBuilder<SettingsController>(
                builder: (_) => CheckboxListTile(
                  title: Text("Send Personalized WhatsApp text"),
                  subtitle: Text("Personalized WhatsApp text sent to saved WhatsApp contacts"),
                  value: settingsController.sendPersonalized,
                  onChanged: (value) => settingsController.togglePersonalized(value),
                ),
              ),
              Divider(),
              InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text("Privacy Policy"),
                  )),
              Divider()
            ],
          ),
        ],
      ),
    );
  }
}

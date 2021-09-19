import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sound_detector/src/controllers/getCurrentLocation.dart';
import 'package:sound_detector/src/controllers/sendMessage.dart';
import 'package:sound_detector/src/controllers/soundRecord.dart';
import 'package:sound_detector/src/helpers/iconsHelper.dart';
import 'package:sound_detector/src/helpers/sendRecord.dart';
import 'package:sound_detector/src/screens/profile.dart';

//fimport 'package:sound_detector/src/screens/profile.dart';
import 'package:sound_detector/src/screens/settings/settings.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen>
    with SingleTickerProviderStateMixin {
  final recorder = SoundRecord();
  final sendMessage = SendMessage();
  final getCurrentLoc = GetCurrentLocation();
  final settings = Settings();
  final sendRecord = SendRecord();

  @override
  void initState() {
    super.initState();

    recorder.init();
    sendMessage.init();
    getCurrentLoc.init();
    getCurrentLoc.getLocData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          "Sound Detector",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          popUpMenu(),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black26,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    settings.settings(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => sendSMSDialog(),
                    child: const Text("Send Emergency Text"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
            child: FloatingActionButton(
              onPressed: () async {
                if (passedCount == 1) leaveCount = true;
                passedCount++;
                if (leaveCount) passedCount--;
                timerCount();
              },
              child: recorder.recordingStatus() == false
                  ? IconHelper.voiceRoundedIcon
                  : IconHelper.stopIcon,
              backgroundColor: recorder.recordingStatus() == false
                  ? Colors.red
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void sendSMSDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Send SMS"),
          content: const Text(
              "Are you sure you want to send an SMS to your emergency contacts?"),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text("Yes"),
              onPressed: () {
                Get.back();
                Get.snackbar("Message Sent",
                    "The message text was sent to the stored contacts.");

                sendSMS();
              },
            ),
          ],
        );
      },
    );
  }

  int passedCount = 0;
  bool leaveCount = false;

  Future timerCount() async {
    setState(() {});
    if (leaveCount) return;
    Timer(const Duration(seconds: 5), () async {
      await recorder.isStartStop();
      timerCount();
    });
  }

  Future sendSMS() async {
    await getCurrentLoc.getLocData();
    await sendMessage.sendSms(
        '+27678752440', getCurrentLoc.lat!, getCurrentLoc.lon!);
    print("SMS Status: ${sendMessage.sentStatus}");
  }

  void sendWhatsApp() {
    sendMessage.sendWhatsApp('+27678752440');
    print("WhatsApp Status: ${sendMessage.sentStatus}");
  }

  void locationGet() {
    getCurrentLoc.getLocData();
  }

  static const menuItems = <String>['Profile'];
  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  Widget popUpMenu() {
    return PopupMenuButton<String>(
      onSelected: (String newValue) {
        changeScreen(newValue);
      },
      itemBuilder: (BuildContext context) => _popUpMenuItems,
    );
  }

  void changeScreen(String screen) {
    switch (screen) {
      case "Profile":
        {
          Get.to(const Profile());
        }
        break;
      default:
        {}
    }
  }
}

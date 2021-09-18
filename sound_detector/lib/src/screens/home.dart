import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sound_detector/src/controllers/getCurrentLocation.dart';
import 'package:sound_detector/src/controllers/sendMessage.dart';
import 'package:sound_detector/src/controllers/soundRecord.dart';
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
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    recorder.init();
    sendMessage.init();
    getCurrentLoc.init();
    getCurrentLoc.getLocData();
    buttonAnim();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void buttonAnim() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController!.repeat(reverse: true);
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
                    Column(
                      children: [
                        settings.settings(),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: FadeTransition(
                    opacity: _animationController!,
                    child: const Text("Recording..."),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
            child: FloatingActionButton(
              onPressed: () async {
                recorder.isStartStop();
                setState(() {
                  print("Recording status: +${recorder.recordingStatus()}");
                });
              },
              child: recorder.recordingStatus() == false
                  ? const Icon(
                      Icons.keyboard_voice_rounded,
                      color: Colors.white,
                      size: 30,
                    )
                  : const Icon(
                      Icons.stop,
                      color: Colors.black,
                      size: 30,
                    ),
              backgroundColor: recorder.recordingStatus() == false
                  ? Colors.red
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void sendSMS() {
    sendMessage.sendSms('+27678752440', getCurrentLoc.lat!, getCurrentLoc.lon!);
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

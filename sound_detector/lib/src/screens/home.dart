import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sound_detector/src/controllers/getCurrentLocation.dart';
import 'package:sound_detector/src/controllers/sendMessage.dart';
import 'package:sound_detector/src/controllers/soundRecord.dart';

//fimport 'package:sound_detector/src/screens/profile.dart';
import 'package:sound_detector/src/screens/settings/settings.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final recorder = SoundRecord();
  final sendMessage = SendMessage();
  final getCurrentLoc = GetCurrentLocation();

  @override
  void initState() {
    super.initState();

    recorder.init();
    sendMessage.init();
    getCurrentLoc.init();
    getCurrentLoc.getLocData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sound Detector"),
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
                        color: Colors.black26, //Color(0x802196F3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Column(
                    children: [
                      const Text("Hello Mazingo"),
                      ElevatedButton(
                          onPressed: () async {
                            //Get.to(Settings());
                            sendMessage.sendSms('+27678752440',
                                getCurrentLoc.lat!, getCurrentLoc.lon!);
                            print("SMS Status: ${sendMessage.sentStatus}");
                          },
                          child: const Text("Send SMS")),
                      ElevatedButton(
                          onPressed: () async {
                            //Get.to(Settings());
                            sendMessage.sendWhatsApp('+27678752440');
                            print("WhatsApp Status: ${sendMessage.sentStatus}");
                          },
                          child: Text("Send WhatsApp")),
                      ElevatedButton(
                          onPressed: () async {
                            getCurrentLoc.getLocData();
                            print("Longitude: ${getCurrentLoc.lon}");
                            print("Latitude: ${getCurrentLoc.lat}");
                          },
                          child: Text("Get Location")),
                    ],
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
                setState(() {});
              },
              child: !recorder.recordingStatus()
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
              backgroundColor:
                  !recorder.recordingStatus() ? Colors.red : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
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

  @override
  void initState() {
    super.initState();

    recorder.init();
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
                      Text("Hello Mazingo"),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(Settings());
                          },
                          child: Text("Record"))
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
              },
              child: Icon(
                Icons.keyboard_voice_rounded,
                color: Colors.white,
                size: 30,
              ),
              backgroundColor: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

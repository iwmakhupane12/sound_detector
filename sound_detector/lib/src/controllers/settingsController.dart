import 'package:get/get.dart';
import 'package:sound_detector/src/models/settingsModel.dart';

class SettingsController extends GetxController {
  bool saveRecording = false;
  void toggleSave(value){
    saveRecording = value;
    update();
  }

  bool sendRecording = false;
  void toggleSend(value){
    sendRecording = value;
    update();
  }

  bool sendPersonalized = false;
  void togglePersonalized(value){
    sendPersonalized = value;
    update();
  }
}
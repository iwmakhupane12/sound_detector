
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SoundRecord{
  String pathToSaveRecord = "";
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecorderInitialized = false;

  void init() async{
    _audioRecorder = FlutterSoundRecorder();

    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();

    final status = await Permission.microphone.status;
    if(status != PermissionStatus.granted){
      throw RecordingPermissionException("Microphone permission is required");
    }

    await _audioRecorder!.openAudioSession();

    await _audioRecorder!.openAudioSession(
        focus: AudioFocus.requestFocusAndStopOthers,
        category: SessionCategory.playAndRecord,
        mode: SessionMode.modeDefault,
        device: AudioDevice.speaker);
    await _audioRecorder!.setSubscriptionDuration(Duration(milliseconds: 10));

    _isRecorderInitialized = true;
  }

    void dispose(){
      _audioRecorder!.closeAudioSession();
      _audioRecorder = null;
      _isRecorderInitialized = false;
    }

  Future _record() async{
    _localPath();

    pathToSaveRecord = DateFormat('kk_mm_ss_EEE_d_MMM').format(DateTime.now());

    await _audioRecorder!.startRecorder(toFile: "$filePath/$pathToSaveRecord.wav" );
  }

  String filePath = "";

  Future<void> _localPath() async {
    final directory = await getExternalStorageDirectory();
    // For your reference print the AppDoc directory
    print(directory!.path);
    filePath = directory.path;
  }

  Future _stop() async{
    await _audioRecorder!.stopRecorder();
  }

  Future isStartStop() async{
    if(_audioRecorder!.isStopped){
      _record();
  }else{
      _stop();
  }
}
}
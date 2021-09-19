// ignore_for_file: file_names

import 'package:http/http.dart' as http;

class SendRecord {
  httpSendRecord(String filename, String url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('audio_record', filename));
    var res = await request.send();
    print("returned info: $res");
  }
}

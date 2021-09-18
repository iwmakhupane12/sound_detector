// ignore_for_file: file_names
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:geocoding/geocoding.dart';

class SendMessage {
  TwilioFlutter? twilioFlutter;

  void init() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'ACc3d25ad90f2b01ea465f6a1742f0e55c',
        authToken: 'a82545cfd571f842e2ac53fc271de64b',
        twilioNumber: '+16103475477');
  }

  int sentStatus = 0;

  Future sendSms(String number, double latitude, double longitude) async {
    sentStatus = 0;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    sentStatus = await twilioFlutter!.sendSMS(
        toNumber: number,
        messageBody:
            'Hi Itumeleng I need help, my latitude and longitude coordidates are : ${placemarks.first}'); /*https://www.google.com/maps/@$longitude,$latitude , call the police);*/
  }

  Future sendWhatsApp(String number) async {
    sentStatus = 0;
    sentStatus = await twilioFlutter!.sendWhatsApp(
        toNumber: number,
        messageBody:
            'Hi Itumeleng I need help, my location is: LatLLang, call the police');
  }
}

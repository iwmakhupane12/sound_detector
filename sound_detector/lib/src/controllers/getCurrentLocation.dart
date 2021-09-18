// ignore_for_file: file_names

import 'package:location/location.dart';

class GetCurrentLocation {
  Location? location;

  void init() {
    location = Location();
    grantPermission();
    locationEnabled();

    location!.onLocationChanged.listen((LocationData currentLocation) {
      lon = currentLocation.longitude;
      lat = currentLocation.latitude;
    });
  }

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  Future locationEnabled() async {
    _serviceEnabled = await location!.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location!.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }
  }

  Future grantPermission() async {
    _permissionGranted = await location!.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location!.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  double? lat, lon;

  Future getLocData() async {
    _locationData = await location!.getLocation();
    lon = _locationData!.longitude;
    lat = _locationData!.latitude;
  }
}

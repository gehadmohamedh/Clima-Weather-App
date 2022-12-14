import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  Location();
  double latitude;
  double longitude;
  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

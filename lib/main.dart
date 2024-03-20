import 'package:camatrix/camatrix.dart';
import 'package:flutter/material.dart';

const mockRTSPData = [
  {
    'name': 'Camera 1',
    'url':
        'rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern',
    'frameRate': 20,
  },
  {
    'name': 'Camera 2',
    'url': 'rtsp://admin:tzv12345@46.210.85.157:10554',
    'frameRate': 20,
  },
];

void main() {
  try {
    // If successful, run the app
    runApp(Camatrix(rtspData: mockRTSPData));
  } catch (e) {
    // Catch any errors during initialization
    // Handle the error appropriately, e.g., log it or display a user-friendly message
    debugPrint("Error initializing MediaKit: $e");
    // You might choose to display an error message or exit the app here
  }
}

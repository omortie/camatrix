import 'package:camatrix/camatrix.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';

const mockRTSPData = [
  {
    'name': 'Camera 1',
    'url':
        'rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern',
    'framerate': 20,
  },
  {
    'name': 'Camera 2',
    'url':
        'rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern',
    'framerate': 20,
  },
];

void main() {
  try {
    // Attempt MediaKit initialization
    MediaKit.ensureInitialized();

    // If successful, run the app
    runApp(Camatrix(rtspData: mockRTSPData));
  } catch (e) {
    // Catch any errors during initialization
    // Handle the error appropriately, e.g., log it or display a user-friendly message
    debugPrint("Error initializing MediaKit: $e");
    // You might choose to display an error message or exit the app here
  }
}

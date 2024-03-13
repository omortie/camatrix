import 'package:camatrix/my_app.dart';
import 'package:camatrix/rtsp_state.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:provider/provider.dart';

void main() {
  try {
    // Attempt MediaKit initialization
    MediaKit.ensureInitialized();

    // If successful, run the app
    runApp(ChangeNotifierProvider(
      create: (context) => RTSPModel(),
      child: MyApp(),
    ));
  } catch (e) {
    // Catch any errors during initialization
    // Handle the error appropriately, e.g., log it or display a user-friendly message
    debugPrint("Error initializing MediaKit: $e");
    // You might choose to display an error message or exit the app here
  }
}

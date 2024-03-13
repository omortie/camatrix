import 'dart:collection';

import 'package:camatrix/my_app.dart';
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

class RTSPModel extends ChangeNotifier {
  final List<String> _rtspList = [
    "rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern"
  ];

  UnmodifiableListView<String> get rtspList => UnmodifiableListView(_rtspList);

  void add(String rtspUrl) {
    _rtspList.add(rtspUrl);

    notifyListeners();
  }

  void removeAll() {
    _rtspList.clear();

    notifyListeners();
  }
}

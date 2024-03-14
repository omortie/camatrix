import 'dart:collection';

import 'package:flutter/material.dart';

class RTSP {
  const RTSP({required this.name, required this.url, required this.frameRate});

  final String url;
  final String name;
  final int frameRate;
}

class RTSPModel extends ChangeNotifier {
  final List<RTSP> _rtspList = [];

  UnmodifiableListView<RTSP> get rtspList => UnmodifiableListView(_rtspList);

  void add(RTSP newRTSP) {
    _rtspList.add(newRTSP);

    notifyListeners();
  }

  void removeAll() {
    _rtspList.clear();

    notifyListeners();
  }
}

import 'dart:collection';

import 'package:flutter/material.dart';

class RTSP {
  late final String url;
  late final String name;
  late final int frameRate;

  RTSP(this.name, this.url, this.frameRate);
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

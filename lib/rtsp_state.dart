import 'dart:collection';

import 'package:flutter/material.dart';

class RTSP {
  const RTSP({required this.name, required this.url, required this.frameRate});

  final String url;
  final String name;
  final int frameRate;

  RTSP.fromJson(Map<String, dynamic> json)
      : url = json['url'] as String,
        name = json['name'] as String,
        frameRate = json['frameRate'] as int;

  Map<String, dynamic> toJson() => {
        'url': url,
        'name': name,
        'frameRate': frameRate,
      };
}

class RTSPState extends ChangeNotifier {
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

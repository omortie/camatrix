import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';

class RTSP {
  const RTSP({required this.name, required this.url, required this.frameRate});

  final String url;
  final String name;
  final int frameRate;

  factory RTSP.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'url': String url,
        'frameRate': int frameRate,
      } =>
        RTSP(
          name: name,
          url: url,
          frameRate: frameRate,
        ),
      _ => throw const FormatException('failed to load rtsp'),
    };
  }

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

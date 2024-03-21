import 'dart:collection';
import 'package:camatrix/rtsp.dart';
import 'package:flutter/material.dart';

class RTSPState extends ChangeNotifier {
  final List<RTSP> _rtspList = [];

  RTSPState({List<Map<String, dynamic>> rtspData = const []}) {
    setRTSPList(rtspData);
  }

  void setRTSPList(List<Map<String, dynamic>> rtspData) {
    removeAll();

    for (final rtsp in rtspData) {
      add(RTSP.fromJson(rtsp));
    }
  }

  UnmodifiableListView<RTSP> get rtspList => UnmodifiableListView(_rtspList);

  void add(RTSP newRTSP) {
    _rtspList.add(newRTSP);

    notifyListeners();
  }

  void removeAll() {
    if (_rtspList.isNotEmpty) {
      _rtspList.clear();

      notifyListeners();
    }
  }
}

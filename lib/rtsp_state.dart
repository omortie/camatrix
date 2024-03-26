import 'dart:collection';
import 'package:camatrix/rtsp.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class DuplicateItemException implements Exception {
  final String message;

  DuplicateItemException(this.message);

  @override
  String toString() => 'DuplicateItemException: $message';
}

class NoSuchElementException implements Exception {
  final String message;

  NoSuchElementException(this.message);

  @override
  String toString() => 'NoSuchElementException: $message';
}

class RTSPState extends ChangeNotifier {
  final Map<String, RTSP> _rtspMap = {};
  final logger = Logger();

  RTSPState({List<Map<String, dynamic>> rtspData = const []}) {
    setRTSPList(rtspData);
  }

  void setRTSPList(List<Map<String, dynamic>> rtspData) {
    removeAll();

    for (final rtsp in rtspData) {
      add(RTSP.fromJson(rtsp));
    }
  }

  UnmodifiableListView<RTSP> get rtspList =>
      UnmodifiableListView(_rtspMap.values);

  void add(RTSP newRTSP) {
    // Make sure that new rtsp name is unique

    if (!_rtspMap.containsKey(newRTSP.url)) {
      _rtspMap[newRTSP.url] = newRTSP;
      notifyListeners();
    } else {
      throw DuplicateItemException(
          "An RTSP with the URL '${newRTSP.url}' already exists.");
    }
  }

  void removeAll() {
    if (_rtspMap.isNotEmpty) {
      _rtspMap.clear();

      notifyListeners();
    }
  }

  void removeRTSP(String url) {
    _rtspMap.remove(url);

    notifyListeners();
  }

  void updateRTSP(RTSP updatedRTSP) {
    if (_rtspMap.containsKey(updatedRTSP.url)) {
      _rtspMap[updatedRTSP.url] = updatedRTSP;

      notifyListeners();
    } else {
      throw NoSuchElementException(
          "RTSP specified with url ${updatedRTSP.name} doesn't exist");
    }
  }
}

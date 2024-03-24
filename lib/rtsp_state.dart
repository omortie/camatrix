import 'dart:collection';
import 'dart:convert';
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
  final List<RTSP> _rtspList = [];
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

  void setRTSPListFromDynamic(dynamic rtspData) {
    try {
      // Decode JSON safely using jsonDecode()
      final decodedData = jsonDecode(rtspData);

      // Check if the decoded data is a List
      if (decodedData is List) {
        // Map each element to a Map<String, dynamic>, ensuring it's a Map
        final rtspReceived = decodedData
            .map((e) => e is Map<String, dynamic> ? e : null)
            .whereType<Map<String, dynamic>>()
            .toList();

        setRTSPList(rtspReceived);
      } else {
        // Handle the case where the decoded data is not a List
        logger.d(
            "Invalid data format: Expected a List, but got ${decodedData.runtimeType}");
      }
    } catch (error) {
      // Handle any errors during decoding or type checks
      logger.d("Error decoding JSON: $error");
      rethrow;
    }
  }

  UnmodifiableListView<RTSP> get rtspList => UnmodifiableListView(_rtspList);

  void add(RTSP newRTSP) {
    // Make sure that new rtsp name is unique

    if (_rtspList.every((element) => element.name != newRTSP.name)) {
      _rtspList.add(newRTSP);
      notifyListeners();
    } else {
      logger.d("Error: Duplicate name '${newRTSP.name}' found in the list.");
      throw DuplicateItemException(
          "An RTSP with the name '${newRTSP.name}' already exists.");
    }
  }

  void removeAll() {
    if (_rtspList.isNotEmpty) {
      _rtspList.clear();

      notifyListeners();
    }
  }

  void removeByName(String name) {
    _rtspList.removeWhere((element) => element.name == name);

    notifyListeners();
  }

  void updateRTSP(RTSP updatedRTSP) {
    int oldRTSPIndex =
        _rtspList.indexWhere((element) => element.name == updatedRTSP.name);

    if (oldRTSPIndex == -1) {
      debugPrint("Specified name doesn't exist in RTSP list");
      throw NoSuchElementException(
          "RTSP specified with name ${updatedRTSP.name} doesn't exist");
    } else {
      _rtspList[oldRTSPIndex] = updatedRTSP;

      notifyListeners();
    }
  }
}

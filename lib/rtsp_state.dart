import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RTSP {
  const RTSP({required this.name, required this.url, required this.frameRate});

  final String url;
  final String name;
  final int frameRate;

  factory RTSP.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'title': String name,
        'userId': int frameRate,
      } =>
        RTSP(
          name: name,
          url:
              'rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern',
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

  Future<void> fetchRTSP() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      add(RTSP.fromJson(jsonDecode(response.body) as Map<String, dynamic>));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load rtsp');
    }
  }
}

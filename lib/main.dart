import 'package:camatrix/camatrix.dart';
import 'package:camatrix/rtsp.dart';
import 'package:flutter/material.dart';

const mockRTSPData = [
  RTSP(
    name: 'Camera 1',
    url: 'rtsp://admin:camteam524@31.154.52.236:10500',
  ),
  RTSP(
      name: 'Camera 2',
      url:
          'rtsp://rtspstream:96d01209a52bb876d5c33853d6431f21@zephyr.rtsp.stream/movie'),
];

void main() {
  runApp(const Camatrix(initialRTSPState: mockRTSPData));
}

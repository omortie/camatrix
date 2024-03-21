import 'package:camatrix/camatrix.dart';
import 'package:flutter/material.dart';

const mockRTSPData = [
  {
    'name': 'Camera 1',
    'url': 'rtsp://admin:camteam524@31.154.52.236:10500',
    'frameRate': 20,
  },
  {
    'name': 'Camera 2',
    'url': 'rtsp://admin:camteam524@31.154.52.236:10500',
    'frameRate': 20,
  },
  {
    'name': 'Camera 3',
    'url': 'rtsp://admin:camteam524@31.154.52.236:10500',
    'frameRate': 20,
  },
  {
    'name': 'Camera 4',
    'url': 'rtsp://admin:camteam524@31.154.52.236:10500',
    'frameRate': 20,
  },
  {
    'name': 'Camera 5',
    'url': 'rtsp://admin:camteam524@31.154.52.236:10500',
    'frameRate': 20,
  },
  {
    'name': 'Camera 6',
    'url': 'rtsp://admin:camteam524@31.154.52.236:10500',
    'frameRate': 20,
  },
  {
    'name': 'Camera 7',
    'url': 'rtsp://admin:camteam524@31.154.52.236:10500',
    'frameRate': 20,
  },
  {
    'name': 'Camera 8',
    'url': 'rtsp://admin:camteam524@31.154.52.236:10500',
    'frameRate': 20,
  },
];

void main() {
  runApp(Camatrix(rtspData: mockRTSPData));
}

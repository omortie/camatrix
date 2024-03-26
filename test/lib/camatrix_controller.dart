import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';

const mockRTSPData = [
  {
    'name': 'Camera 1',
    'url': 'rtsp://admin:camteam524@31.154.52.236:10500',
    'frameRate': 20,
  },
  {
    'name': 'Camera 2',
    'url':
        'rtsp://rtspstream:96d01209a52bb876d5c33853d6431f21@zephyr.rtsp.stream/movie',
    'frameRate': 20,
  },
];

class CamatrixController extends StatefulWidget {
  @override
  State<CamatrixController> createState() => _CamatrixControllerState();
}

class _CamatrixControllerState extends State<CamatrixController> {
  late int slaveWindowId = -1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MainApp",
      home: Container(
        color: Colors.cyan,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: TextButton(
                  onPressed: openCamatrix,
                  child: const Text("Open Camatrix"),
                ),
              ),
              Card(
                child: TextButton(
                  onPressed: setRTSPInCamatrix,
                  child: const Text("Set RTSP List (Initialize)"),
                ),
              ),
              Card(
                child: TextButton(
                  onPressed: addRTSPToCamatrix,
                  child: const Text("Add RTSP (Camera 3)"),
                ),
              ),
              Card(
                child: TextButton(
                  onPressed: removeRTSPFromCamatrix,
                  child: const Text("Remove RTSP (Camera 2)"),
                ),
              ),
              Card(
                child: TextButton(
                  onPressed: updateRTSPInCamatrix,
                  child: const Text("Update RTSP (Camera 1)"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void openCamatrix() async {
    final window =
        await DesktopMultiWindow.createWindow(jsonEncode(mockRTSPData));
    window
      ..center()
      ..setTitle('Camatrix')
      ..show();
    setState(() {
      slaveWindowId = window.windowId;
    });
    debugPrint("Camatrix window id: $slaveWindowId");
  }

  void setRTSPInCamatrix() async {
    if (slaveWindowId == -1) {
      return;
    }

    final result = await DesktopMultiWindow.invokeMethod(
      slaveWindowId,
      "setRTSP",
      jsonEncode(mockRTSPData),
    );
    debugPrint("result initialize set RTSP: $result");
  }

  void addRTSPToCamatrix() async {
    if (slaveWindowId == -1) {
      return;
    }

    final result = await DesktopMultiWindow.invokeMethod(
      slaveWindowId,
      "addRTSP",
      jsonEncode({
        'name': 'Camera 3',
        'url':
            'rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern',
        'frameRate': 20,
      }),
    );
    debugPrint("result adding RTSP: $result");
  }

  void removeRTSPFromCamatrix() async {
    if (slaveWindowId == -1) {
      return;
    }

    final result = await DesktopMultiWindow.invokeMethod(
      slaveWindowId,
      "removeRTSP",
      jsonEncode({
        "url":
            "rtsp://rtspstream:96d01209a52bb876d5c33853d6431f21@zephyr.rtsp.stream/movie",
      }),
    );
    debugPrint("result removing RTSP: $result");
  }

  void updateRTSPInCamatrix() async {
    if (slaveWindowId == -1) {
      return;
    }

    final result = await DesktopMultiWindow.invokeMethod(
      slaveWindowId,
      "updateRTSP",
      jsonEncode({
        "name": "Updated Camera",
        "url": "rtsp://admin:camteam524@31.154.52.236:10500",
        "frameRate": 30,
      }),
    );
    debugPrint("result updating RTSP: $result");
  }
}

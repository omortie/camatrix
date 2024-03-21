import 'dart:convert';

import 'package:camatrix/camatrix.dart';
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
    'url': 'rtsp://admin:camteam524@31.154.52.236:10500',
    'frameRate': 20,
  },
];

void main(List<String> args) {
  if (args.firstOrNull == 'multi_window') {
    final windowId = int.parse(args[1]);

    runApp(Camatrix());
  } else {
    // runApp(Camatrix(rtspData: mockRTSPData));
    runApp(MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int slaveWindowId;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MainApp",
      home: Container(
        color: Colors.cyan,
        child: Center(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    final window = await DesktopMultiWindow.createWindow(
                        jsonEncode(mockRTSPData));
                    window
                      ..center()
                      ..setTitle('Camatrix')
                      ..show();
                    setState(() {
                      slaveWindowId = window.windowId;
                    });
                  },
                  child: const Text("Open Camatrix"),
                ),
                TextButton(
                  onPressed: () => addRTSPToCamatrix(),
                  child: const Text("Add RTSP"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addRTSPToCamatrix() async {
    final result = await DesktopMultiWindow.invokeMethod(
        slaveWindowId, "setRTSP", jsonEncode(mockRTSPData));
    debugPrint("result: $result");
  }
}

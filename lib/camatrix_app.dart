import 'dart:convert';

import 'package:camatrix/home_widget.dart';
import 'package:camatrix/rtsp_state.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CamatrixApp extends StatefulWidget {
  @override
  State<CamatrixApp> createState() => _CamatrixAppState();
}

class _CamatrixAppState extends State<CamatrixApp> {
  @override
  void initState() {
    super.initState();

    DesktopMultiWindow.setMethodHandler(_handleMethodCallback);
  }

  @override
  dispose() {
    super.dispose();
    DesktopMultiWindow.setMethodHandler(null);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Camatrix",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: HomeWidget(),
    );
  }

  Future<dynamic> _handleMethodCallback(
      MethodCall call, int fromWindowId) async {
    if (call.arguments.toString() == "ping") {
      return "pong";
    }

    if (call.method == "setRTSP") {
      final rtspReceived = (jsonDecode(call.arguments) as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
      Future.microtask(
          () => context.read<RTSPState>().setRTSPList(rtspReceived));
    }
  }
}

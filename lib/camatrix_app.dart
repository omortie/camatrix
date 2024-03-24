import 'dart:convert';

import 'package:camatrix/home_widget.dart';
import 'package:camatrix/rtsp.dart';
import 'package:camatrix/rtsp_state.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CamatrixApp extends StatefulWidget {
  @override
  State<CamatrixApp> createState() => _CamatrixAppState();
}

class _CamatrixAppState extends State<CamatrixApp> {
  var logger = Logger();

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
      try {
        await Future.microtask(() =>
            context.read<RTSPState>().setRTSPListFromDynamic(call.arguments));
        return "Done setRTSP";
      } catch (error) {
        return "Couldn't set RTSP list since $error";
      }
    }

    if (call.method == "removeRTSP") {
      final String name = jsonDecode(call.arguments)['name'];
      if (name.isNotEmpty) {
        await Future.microtask(
            () => context.read<RTSPState>().removeByName(name));
        return "Done removeRTSP";
      } else {
        return "Name should be specified";
      }
    }

    if (call.method == "addRTSP") {
      try {
        RTSP newRTSP = RTSP.fromJson(jsonDecode(call.arguments));
        await Future.microtask(() => context.read<RTSPState>().add(newRTSP));
        return "Done addRTSP";
      } catch (error) {
        return "Couldn't add new RTSP since $error";
      }
    }

    if (call.method == "updateRTSP") {
      try {
        RTSP updatedRTSP = RTSP.fromJson(jsonDecode(call.arguments));
        await Future.microtask(
            () => context.read<RTSPState>().updateRTSP(updatedRTSP));
        return "Done updateRTSP";
      } catch (error) {
        return "Couldn't update RTSP since $error";
      }
    }
  }
}

import 'package:camatrix/camatrix_app.dart';
import 'package:camatrix/rtsp.dart';
import 'package:camatrix/rtsp_state.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:provider/provider.dart';

class Camatrix extends StatefulWidget {
  final List<RTSP> initialRTSPState;

  const Camatrix({
    this.initialRTSPState = const [],
    super.key,
  });

  @override
  State<Camatrix> createState() => _CamatrixState();
}

class _CamatrixState extends State<Camatrix> {
  @override
  void initState() {
    super.initState();

    try {
      // Attempt MediaKit initialization
      MediaKit.ensureInitialized();
    } catch (e) {
      debugPrint("Error initializing MediaKit: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RTSPState(initialRTSPState: widget.initialRTSPState),
      child: CamatrixApp(),
    );
  }
}

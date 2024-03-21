import 'package:camatrix/camatrix_app.dart';
import 'package:camatrix/rtsp_state.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:provider/provider.dart';

class Camatrix extends StatefulWidget {
  final List<Map<String, dynamic>> rtspData;

  const Camatrix({
    this.rtspData = const [],
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
      create: (context) => RTSPState(rtspData: widget.rtspData),
      child: CamatrixApp(),
    );
  }
}

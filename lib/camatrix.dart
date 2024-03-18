import 'package:camatrix/camatrix_app.dart';
import 'package:camatrix/rtsp_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Camatrix extends StatelessWidget {
  final List<Map<String, dynamic>> rtspData;

  const Camatrix({
    required this.rtspData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RTSPState(),
      child: CamatrixApp(),
    );
  }
}

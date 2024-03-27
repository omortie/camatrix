import 'package:camatrix/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class CamatrixApp extends StatefulWidget {
  @override
  State<CamatrixApp> createState() => _CamatrixAppState();
}

class _CamatrixAppState extends State<CamatrixApp> {
  var logger = Logger();

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
}

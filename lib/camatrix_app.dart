import 'package:camatrix/home_widget.dart';
import 'package:flutter/material.dart';

class CamatrixApp extends StatelessWidget {
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

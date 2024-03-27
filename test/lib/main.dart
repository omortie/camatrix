import 'package:camatrix/camatrix.dart';
import 'package:flutter/material.dart';

import 'camatrix_controller.dart';

void main(List<String> args) {
  if (args.firstOrNull == 'multi_window') {
    runApp(const Camatrix());
  } else {
    runApp(const CamatrixController());
  }
}

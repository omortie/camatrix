import 'dart:collection';

import 'package:flutter/material.dart';

class RTSPModel extends ChangeNotifier {
  final List<String> _rtspList = [];

  UnmodifiableListView<String> get rtspList => UnmodifiableListView(_rtspList);

  void add(String rtspUrl) {
    _rtspList.add(rtspUrl);

    notifyListeners();
  }

  void removeAll() {
    _rtspList.clear();

    notifyListeners();
  }
}

import 'package:camatrix/dashboard_page.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: null,
        ),
        title: const Text("Dashboard"),
      ),
      body: DashboardPage(),
    );
  }
}

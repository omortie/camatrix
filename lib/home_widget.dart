import 'package:camatrix/dashboard_page.dart';
import 'package:camatrix/settings_page.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Dashboard",
                icon: Icon(Icons.dashboard),
              ),
              Tab(
                text: "Settings",
                icon: Icon(Icons.settings),
              )
            ],
          ),
          title: const Text("Camatrix"),
        ),
        body: TabBarView(
          children: [
            DashboardPage(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}

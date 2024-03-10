import 'package:camatrix/dashboard_page.dart';
import 'package:camatrix/settings_page.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var selectedIndex = 0;
  var isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = DashboardPage();
      case 1:
        page = SettingsPage();
      default:
        throw UnimplementedError("no widget for $selectedIndex");
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              setState(() {
                isMenuOpen = !isMenuOpen;
              });
            },
          ),
          title: const Text("Camatrix"),
        ),
        body: Row(
          children: [
            Visibility(
              visible: isMenuOpen,
              child: NavigationRail(
                extended: constraints.maxWidth > 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.dashboard),
                    label: const Text("Dashboard"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: const Text("Settings"),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: page,
            ),
          ],
        ),
      );
    });
  }
}

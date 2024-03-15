import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double aspectRatio = 0.8;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    aspectRatio = prefs.getDouble("aspectRatio") ?? 0.8;
    setState(() {});
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble("aspectRatio", aspectRatio);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Dummy Settings"),
          Slider(
            min: 0.5,
            max: 2,
            label: "Aspect Ratio",
            value: aspectRatio,
            onChanged: (value) {
              setState(() {
                aspectRatio = value;
              });
              _saveSettings();
            },
          )
        ],
      ),
    );
  }
}

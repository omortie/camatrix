import 'package:camatrix/camera_view.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart'; // Provides [Player], [Media], [Playlist] etc.

void main() {
  try {
    // Attempt MediaKit initialization
    MediaKit.ensureInitialized();

    // If successful, run the app
    runApp(MyApp());
  } catch (e) {
    // Catch any errors during initialization
    // Handle the error appropriately, e.g., log it or display a user-friendly message
    print("Error initializing MediaKit: $e");
    // You might choose to display an error message or exit the app here
  }
}

class MyApp extends StatelessWidget {
  // Sample rtsp list (it can be fetched from a backend server)
  final List<String> rtspList = [
    'rtsp://rtspstream:96d01209a52bb876d5c33853d6431f21@zephyr.rtsp.stream/movie',
    'rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern',
    'rtsp://rtspstream:96d01209a52bb876d5c33853d6431f21@zephyr.rtsp.stream/movie',
    'rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      home: MyHomePage(
        rtspList: rtspList,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.rtspList, super.key});

  final List<String> rtspList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: null,
        ),
        title: const Text("Camatrix Dashboard"),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: GridView.count(
          crossAxisCount: 3,
          // Add spacing between grid items
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          // Define the widget builder for each grid item
          children: rtspList.map((rtsp) => _buildCameraView(rtsp)).toList(),
        ),
      ),
    );
  }

  Widget _buildCameraView(String url) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: CameraView(rtspURL: url),
    );
  }
}

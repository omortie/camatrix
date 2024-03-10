import 'package:flutter/material.dart';
import 'package:camatrix/camera_view.dart';

class DashboardPage extends StatelessWidget {
  final List<String> rtspList = [
    'rtsp://rtspstream:96d01209a52bb876d5c33853d6431f21@zephyr.rtsp.stream/movie',
    'rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern',
    'rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern',
    'rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern',
    'rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern',
    'rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: GridView.count(
        crossAxisCount: 3,
        // Add spacing between grid items
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 1.8,
        // Define the widget builder for each grid item
        children: rtspList.map((url) => _buildCameraView(url)).toList(),
      ),
    );
  }

  Widget _buildCameraView(String url) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: CameraView(rtspURL: url),
    );
  }
}

import 'package:camatrix/rtsp_state.dart';
import 'package:flutter/material.dart';
import 'package:camatrix/camera_view.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RTSPModel>(builder: (context, rtsps, child) {
      return Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: GridView.count(
            crossAxisCount: 3,
            // Add spacing between grid items
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 1.8,
            // Define the widget builder for each grid item
            children: rtsps.rtspList
                .map((rtsp) => _buildCameraView(rtsp.url))
                .toList(),
          ),
        ),
        floatingActionButton: IconButton(
          onPressed: () {
            rtsps.add(RTSP(
                "New",
                "rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern",
                200));
          },
          icon: const Icon(Icons.add),
        ),
      );
    });
  }

  Widget _buildCameraView(String url) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: CameraView(rtspURL: url),
    );
  }
}

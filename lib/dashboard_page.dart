import 'package:camatrix/rtsp_state.dart';
import 'package:flutter/material.dart';
import 'package:camatrix/camera_view.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RTSPState>(builder: (context, rtsps, child) {
      return Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: GridView.builder(
            itemCount: rtsps.rtspList.length,
            itemBuilder: (context, index) =>
                _buildCameraView(context, rtsps.rtspList[index]),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 480.0,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            padding: EdgeInsets.all(5),
          ),
        ),
        floatingActionButton: IconButton(
          onPressed: () => _addRTSPToModel(rtsps),
          icon: const Icon(Icons.add),
        ),
      );
    });
  }

  Widget _buildCameraView(BuildContext context, RTSP rtsp) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rtsp.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Flexible(
            child: CameraView(rtsp: rtsp),
          ),
        ],
      ),
    );
  }

  void _addRTSPToModel(RTSPState rtsps) {
    rtsps.add(RTSP(
      name: "Camera ${rtsps.rtspList.length + 1}",
      url:
          "rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern",
      frameRate: 20,
    ));
  }
}

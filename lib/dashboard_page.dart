import 'package:camatrix/rtsp.dart';
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
}

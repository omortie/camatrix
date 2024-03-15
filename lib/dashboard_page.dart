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
          child: GridView.builder(
            itemCount: rtsps.rtspList.length,
            itemBuilder: (context, index) {
              return _buildCameraView(context, rtsps.rtspList[index]);
            },
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 480.0,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
          ),
        ),
        floatingActionButton: IconButton(
          onPressed: () {
            rtsps.add(RTSP(
              name: "New",
              url:
                  "rtsp://rtspstream:a349b013a371642450e3ace0d41b7a9a@zephyr.rtsp.stream/pattern",
              frameRate: 20,
            ));
          },
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
          Text(rtsp.name),
          Flexible(child: CameraView(rtsp: rtsp)),
        ],
      ),
    );
  }
}

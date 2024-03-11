import 'package:flutter/material.dart';

import 'package:media_kit/media_kit.dart'; // Provides [Player], [Media], [Playlist] etc.
import 'package:media_kit_video/media_kit_video.dart'; // Provides [VideoController] & [Video] etc.
import 'package:logger/logger.dart';

class CameraView extends StatefulWidget {
  const CameraView({required this.rtspURL, super.key});

  final String rtspURL;

  @override
  State<CameraView> createState() => CameraViewState();
}

class CameraViewState extends State<CameraView> {
  // Create a [Player] to control playback.
  late final player = Player(
    configuration: PlayerConfiguration(
      muted: true,
    ),
  );

  late final playable = Media(widget.rtspURL);

  // Create a [VideoController] to handle video output from [Player].
  late final controller = VideoController(player);

  var logger = Logger();

  @override
  void initState() {
    super.initState();
    // Play a [Media] or [Playlist].
    player.open(
      playable,
      play: false,
    );

    player.stream.error.listen((event) {
      logger.d('There is an error with player: $event');
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        final double maxHeight = maxWidth * 9.0 / 16.0;

        return Center(
          child: SizedBox(
            width: maxWidth,
            height: maxHeight,
            child: Video(controller: controller),
          ),
        );
      },
    );
  }
}

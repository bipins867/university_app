import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerMMUT extends StatelessWidget {
  const VideoPlayerMMUT({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: 'SpMVPPIl8x0',
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        ),
        showVideoProgressIndicator: true,
      ),
    );
  }
}

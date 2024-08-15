import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YtVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const YtVideoPlayer({
    super.key,
    required this.videoUrl,
  });

  @override
  State<YtVideoPlayer> createState() => _YtVideoPlayerState();
}

class _YtVideoPlayerState extends State<YtVideoPlayer> {
  late YoutubePlayerController _playerController;

  @override
  void initState() {
    super.initState();
    _playerController = YoutubePlayerController(
        initialVideoId: widget.videoUrl,
        flags: const YoutubePlayerFlags(
            disableDragSeek: true,
            hideControls: false,
            forceHD: true,
            autoPlay: false,
            mute: true));
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(32),
        child: YoutubePlayer(
          controller: _playerController,
          showVideoProgressIndicator: true,

        ),
      );
    } catch (e) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(e.toString()),
          );
        },
      );
    }

    return Container();
  }
}

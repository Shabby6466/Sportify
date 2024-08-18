import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YtVideoPlayer extends StatefulWidget {
  final String videoUrl;

  final Function(YoutubePlayerController) onPlay;

  const YtVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.onPlay,
  });

  @override
  State<YtVideoPlayer> createState() => _YtVideoPlayerState();
}

class _YtVideoPlayerState extends State<YtVideoPlayer>
    with AutomaticKeepAliveClientMixin {
  YoutubePlayerController? _playerController;

  @override
  void initState() {
    super.initState();

      final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
      _playerController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          disableDragSeek: true,
          hideControls: false,
          forceHD: false,
          autoPlay: false,
          mute: false,
        ),
      );
      _playerController!.addListener(() {
        if (_playerController!.value.isPlaying) {
          widget.onPlay(_playerController!);
        }
      });

  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _playerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(32),
      child: YoutubePlayer(
        controller: _playerController!,
        showVideoProgressIndicator: true,
      ),
    );
  }
}

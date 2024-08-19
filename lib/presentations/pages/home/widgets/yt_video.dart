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

class _YtVideoPlayerState extends State<YtVideoPlayer> {
  bool isPlayerReady = false;
  bool isLoading = true;
  YoutubePlayerController? _playerController;

  void initializePlayer() {
    Future.delayed(const Duration(seconds: 1), () {
      final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
      if (videoId != null) {
        _playerController = YoutubePlayerController(
          initialVideoId: videoId!,
          flags: const YoutubePlayerFlags(
            useHybridComposition: false,
            enableCaption: false,
            disableDragSeek: true,
            hideControls: false,
            forceHD: false,
            autoPlay: false,
          ),
        );
        _playerController!.addListener(() {
          if (_playerController!.value.isPlaying) {
            widget.onPlay(_playerController!);
          }
        });
        if (mounted) {
          setState(() {
            isPlayerReady = true;
            isLoading = false;
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _playerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isPlayerReady) {
      return Stack(
        children: [
          YoutubePlayer(
            controller: _playerController!,
            showVideoProgressIndicator: true,
            onReady: () {
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            },
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      );
    }
    return GestureDetector(
      onTap: initializePlayer,
      child: Image.network(
        'https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(widget.videoUrl)}/0.jpg',
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

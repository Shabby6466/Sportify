import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/pages/home/widgets/yt_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatelessWidget {
  final String text, videoUrl;

  Video({
    super.key,
    required this.text,
    required this.videoUrl,
  });

  YoutubePlayerController? _activeController;

  void _onPlay(YoutubePlayerController playerController) {
    if (_activeController != null && _activeController != playerController) {
      _activeController!.pause();
    }
    _activeController = playerController;
  }

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    return Padding(
      padding: EdgeInsets.only(
        top: screenUtil.setHeight(32),
        bottom: screenUtil.setHeight(12),
      ),
      child: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: screenUtil.setHeight(10)),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: screenUtil.setSp(16),
                    height: screenUtil.setSp(18) / screenUtil.setSp(18),
                  ),
            ),
          ),
          YtVideoPlayer(
            videoUrl: videoUrl,
            onPlay: _onPlay,
          ),
        ],
      ),
    );
  }
}

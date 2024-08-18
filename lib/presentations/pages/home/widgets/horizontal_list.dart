import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/pages/home/widgets/video_urls.dart';
import 'package:sportify/presentations/pages/home/widgets/yt_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HorizontalList extends StatelessWidget {
  late YoutubePlayerController _activeController;

  void _onPlay(YoutubePlayerController playerController) {
    if (_activeController != null && _activeController != playerController) {
      _activeController!.pause();
    }
    _activeController = playerController;
  }

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();

    return SizedBox(
      height: 300,
      width: MediaQuery.sizeOf(context).width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: screenUtil.setWidth(5)),
          SizedBox(
            height: 280,
            width: 180,
            child: YtVideoPlayer(
              videoUrl: VideoUrls.whyStartCalisthenics,
              onPlay: _onPlay,
            ),
          ),
          SizedBox(width: screenUtil.setWidth(15)),
          SizedBox(
            height: 280,
            width: 180,
            child: YtVideoPlayer(
              videoUrl: VideoUrls.checkForm,
              onPlay: _onPlay,
            ),
          ),
          SizedBox(width: screenUtil.setWidth(15)),
          SizedBox(
            height: 280,
            width: 180,
            child: YtVideoPlayer(
              videoUrl: VideoUrls.breakDownYourGoals,
              onPlay: _onPlay,
            ),
          ),
        ],
      ),
    );
  }
}

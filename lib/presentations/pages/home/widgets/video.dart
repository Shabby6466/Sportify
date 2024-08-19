import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/pages/home/widgets/video_controller.dart';
import 'package:sportify/presentations/pages/home/widgets/yt_video.dart';

class Video extends StatelessWidget {
  final String text, videoUrl;

  const Video({
    super.key,
    required this.text,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    final videoController = GetIt.I<VideoController>();
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
          ClipRRect(
            borderRadius: BorderRadius.circular(screenUtil.radius(26)),
            child: YtVideoPlayer(
              videoUrl: videoUrl,
              onPlay: videoController.onPlay,
            ),
          ),
        ],
      ),
    );
  }
}

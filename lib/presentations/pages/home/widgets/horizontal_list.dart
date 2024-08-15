import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/pages/home/widgets/video_urls.dart';
import 'package:sportify/presentations/pages/home/widgets/yt_video.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    return Container(
      height: 300,
      width: MediaQuery.sizeOf(context).width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: screenUtil.setWidth(5)),
          const SizedBox(
              height: 280 ,
              width: 180,
              child: YtVideoPlayer(
                videoUrl: VideoUrls.whyStartCalisthenics,
              )),
          SizedBox(width: screenUtil.setWidth(15)),
          const SizedBox(
              height: 280,
              width: 180,
              child: YtVideoPlayer(
                videoUrl: VideoUrls.checkForm,
              )),
          SizedBox(width: screenUtil.setWidth(15)),
          const SizedBox(
              height: 280,
              width: 180,
              child: YtVideoPlayer(
                videoUrl: VideoUrls.breakDownYourGoals,
              ))
        ],
      ),
    );
  }
}

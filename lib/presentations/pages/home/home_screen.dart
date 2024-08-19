import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/pages/home/widgets/video.dart';
import 'package:sportify/presentations/pages/home/widgets/video_urls.dart';
import 'package:sportify/presentations/pages/themes/image_const.dart';
import 'package:sportify/widgets/main_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    return MainScaffold(
      title: "Home",
      bodyContainer: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                screenUtil.setSp(0), 80, screenUtil.setSp(0), 0),
            child: const Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenUtil.setWidth(32)),
            child: Row(
              children: [
                Image.asset(ImageConstants.profile),
                SizedBox(
                  width: screenUtil.setWidth(10),
                ),
                Text(
                  "James Johnson",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      height:
                          screenUtil.setHeight(26) / screenUtil.setHeight(26),
                      fontSize: screenUtil.setHeight(26)),
                ),
                const Spacer(),
                const Icon(CupertinoIcons.settings)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenUtil.setWidth(30),
              right: screenUtil.setWidth(32),
              top: screenUtil.setHeight(30),
            ),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  "Suggested Challenges",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: screenUtil.setSp(24),
                        height: screenUtil.setSp(15) / screenUtil.setSp(15),
                      ),
                ),
                SizedBox(height: screenUtil.setHeight(8)),
                Text(
                  "Make things exciting by joining other people \ncustom challenges and building\na happier community",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: screenUtil.setSp(15),
                        height: screenUtil.setSp(15) / screenUtil.setSp(15),
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenUtil.setWidth(30),
                right: screenUtil.setWidth(32),
                top: screenUtil.setHeight(30),
                bottom: screenUtil.setHeight(30)),
            child: const Wrap(
              children: [
                Video(
                    text: "Calisthenics Explained",
                    videoUrl: VideoUrls.calisthenicsExplained),
                Video(
                    text: "How your body changes with Calisthenics",
                    videoUrl: VideoUrls.howBodyChanges),
                Video(
                    text: "5 Ways to Improve Grip",
                    videoUrl: VideoUrls.fiveWaysToImproveGrip),
                Video(
                    text: "Push-Ups VS Dips", videoUrl: VideoUrls.pushUpVsDips),
                Video(
                    text: "Firstly Break Down Your Goals",
                    videoUrl: VideoUrls.breakDownYourGoals),
                Video(
                    text: "Check & Fix the Form",
                    videoUrl: VideoUrls.checkForm),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

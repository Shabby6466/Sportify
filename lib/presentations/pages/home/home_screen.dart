import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sportify/presentations/pages/home/widgets/horizontal_list.dart';
import 'package:sportify/presentations/pages/home/widgets/video.dart';
import 'package:sportify/presentations/pages/home/widgets/video_urls.dart';
import 'package:sportify/presentations/pages/themes/image_const.dart';
import 'package:sportify/presentations/pages/themes/my_colors.dart';
import 'package:sportify/widgets/main_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenUtil = GetIt.I<ScreenUtil>();
    return MainScaffold(
      myAppBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: screenUtil.setSp(24),
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          Icon(CupertinoIcons.search, size: screenUtil.setHeight(25)),
          SizedBox(
            width: screenUtil.setWidth(10),
          ),
          Icon(CupertinoIcons.bell_circle, size: screenUtil.setHeight(25)),
          SizedBox(
            width: screenUtil.setWidth(30),
          ),
        ],
        backgroundColor: MyColors.bgWhite,
      ),
      bodyContainer: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                screenUtil.setSp(0), 80, screenUtil.setSp(0), 0),
            child: const Divider(),
          ),
          SizedBox(
            height: screenUtil.setHeight(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenUtil.setWidth(32)),
            child: Row(
              children: [
                Image.asset(ImageConstants.profile),
                SizedBox(
                  width: screenUtil.setWidth(10),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "James Johnson",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          height: screenUtil.setHeight(26) /
                              screenUtil.setHeight(26),
                          fontSize: screenUtil.setHeight(26)),
                    ),
                    Text(
                      "21 Days Challenge",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          height: screenUtil.setHeight(18) /
                              screenUtil.setHeight(15),
                          fontSize: screenUtil.setHeight(15)),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(CupertinoIcons.settings)
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: screenUtil.setWidth(30),
                    right: screenUtil.setWidth(32),
                    top: screenUtil.setHeight(30),
                    bottom: screenUtil.setHeight(30)),
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
              const HorizontalList(),
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
                        VideoUrl: VideoUrls.calisthenicsExplained),
                    Video(
                        text: "How your body changes with Calisthenics",
                        VideoUrl: VideoUrls.howBodyChanges),
                    Video(
                        text: "5 Ways to Improve Grip",
                        VideoUrl: VideoUrls.fiveWaysToImproveGrip),
                    Video(
                        text: "Push-Ups VS Dips",
                        VideoUrl: VideoUrls.pushUpVsDips),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

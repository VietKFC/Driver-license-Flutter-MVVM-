import 'package:driver_license_test/constant/Constant.dart';
import 'package:driver_license_test/ui/common_widget.dart';
import 'package:driver_license_test/ui/detail/widget/video_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

import '../../../data/model/video.dart';

class VideoViewWidget extends StatefulWidget {
  final List<Video> videoList;
  final int videoIndex;

  const VideoViewWidget(
      {Key? key, required this.videoList, required this.videoIndex})
      : super(key: key);

  @override
  State<VideoViewWidget> createState() => _VideoViewWidgetState();
}

class _VideoViewWidgetState extends State<VideoViewWidget> {
  int currentIndexVideo = 0;
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    _scrollController = FixedExtentScrollController();
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _scrollController.animateToItem(widget.videoIndex,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 300.0,
          child: Stack(
            children: [
              FlutterYoutubeView(
                scaleMode: YoutubeScaleMode.none,
                params: YoutubeParam(
                    videoId: widget.videoList[widget.videoIndex].key,
                    startSeconds: 0),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: AppConstant.smallPadding,
                          left: AppConstant.smallPadding),
                      child: backButtonWidget(context)))
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        SizedBox(
          height: 180,
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoViewWidget(
                            videoList: widget.videoList,
                            videoIndex: currentIndexVideo)));
              });
            },
            child: ListWheelScrollViewX(
                scrollDirection: Axis.horizontal,
                itemExtent: 200,
                controller: _scrollController,
                onSelectedItemChanged: (index) => currentIndexVideo = index,
                clipBehavior: Clip.antiAlias,
                children: [
                  for (var video in widget.videoList) ...[
                    videoItemWidget(video)
                  ]
                ]),
          ),
        )
      ],
    );
  }
}

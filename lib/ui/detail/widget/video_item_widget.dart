import 'package:cached_network_image/cached_network_image.dart';
import 'package:driver_license_test/constant/Constant.dart';
import 'package:driver_license_test/data/model/video.dart';
import 'package:flutter/cupertino.dart';

import '../../common_widget.dart';

Widget videoItemWidget(Video video) {
  return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    Container(
      height: 140.0,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.0)),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: AppConstant.youtubeThumbnail(video.key),
            fit: BoxFit.cover,
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/ic_background_play.png",
                  width: 58,
                  height: 58,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: AppConstant.smallPadding / 2),
                  child: Image.asset(
                    "assets/images/ic_play.png",
                    width: 19,
                    height: 21,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
    Text(
      video.name,
      style: textStyleDetail,
      maxLines: 2,
    )
  ]);
}

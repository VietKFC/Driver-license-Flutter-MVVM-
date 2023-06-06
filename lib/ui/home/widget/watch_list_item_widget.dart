import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constant/Constant.dart';
import '../../../data/model/movie.dart';

class WatchListItemWidget extends StatelessWidget {
  final Movie movie;

  const WatchListItemWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 107.0,
          height: 163.0,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.0),
                  topRight: Radius.circular(3.0))),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: movie.posterPath,
                fit: BoxFit.fill,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: AppConstant.smallPadding / 2,
                      left: AppConstant.smallPadding / 2),
                  child: Image.asset(
                    "assets/images/ic_netflix.png",
                    width: 11.0,
                    height: 19.0,
                  ),
                ),
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
                      padding:
                          EdgeInsets.only(left: AppConstant.smallPadding / 2),
                      child: Image.asset(
                        "assets/images/ic_play.png",
                        width: 19,
                        height: 21,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          width: 107.0,
          height: 30.0,
          color: AppConstant.color1A1A1A,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: AppConstant.smallPadding),
                child: Image.asset(
                  "assets/images/ic_information.png",
                  width: 20,
                  height: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: AppConstant.smallPadding * 1.5),
                child: Image.asset(
                  "assets/images/ic_menu.png",
                  width: 4.0,
                  height: 19,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

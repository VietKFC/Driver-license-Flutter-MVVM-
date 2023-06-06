import 'package:cached_network_image/cached_network_image.dart';
import 'package:driver_license_test/constant/Constant.dart';
import 'package:driver_license_test/data/model/tvshow.dart';
import 'package:flutter/material.dart';

class TvShowItemWidget extends StatelessWidget {
  final TvShow tvShow;

  const TvShowItemWidget({super.key, required this.tvShow});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 107.0,
      height: 163.0,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0))),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: tvShow.posterPath,
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
          )
        ],
      ),
    );
  }
}

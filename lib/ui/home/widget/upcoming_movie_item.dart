import 'package:cached_network_image/cached_network_image.dart';
import 'package:driver_license_test/constant/Constant.dart';
import 'package:driver_license_test/data/model/movie.dart';
import 'package:flutter/material.dart';

import '../../navigator/app_route.dart';

class UpcomingMovieWidget extends StatelessWidget {
  final Movie movie;

  const UpcomingMovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 107.0,
      height: 163.0,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.0))),
      clipBehavior: Clip.hardEdge,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
            context, RouteConstant.MOVIE_DETAIL_ROUTE,
            arguments: movie),
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
            )
          ],
        ),
      ),
    );
  }
}

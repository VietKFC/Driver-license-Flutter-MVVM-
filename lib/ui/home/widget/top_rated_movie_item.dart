import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constant/Constant.dart';
import '../../../data/model/movie.dart';
import '../../navigator/app_route.dart';

class TopRatedMovieWidget extends StatelessWidget {
  final Movie movie;

  const TopRatedMovieWidget({Key? key, required this.movie}) : super(key: key);

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
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                color: Colors.red[800],
                width: 23.55,
                height: 30.79,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    movie.voteAverage.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 12),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

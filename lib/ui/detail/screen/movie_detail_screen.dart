import 'package:cached_network_image/cached_network_image.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:driver_license_test/constant/Constant.dart';
import 'package:driver_license_test/ui/common_widget.dart';
import 'package:driver_license_test/ui/detail/viewmodel/movie_detail_viewmodel.dart';
import 'package:driver_license_test/ui/detail/widget/video_view.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../data/model/movie.dart';
import '../../../data/model/video.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailViewModel movieDetailViewModel;
  List<Video> videoList = [];

  void initData() {
    movieDetailViewModel = context.read<MovieDetailViewModel>()
      ..getBackdropList(widget.movie.id)
      ..getMovieDetail(widget.movie.id)
      ..getVideosByMovieId(widget.movie.id);
    movieDetailViewModel.videoListController.stream.listen((data) {
      videoList.addAll(data);
    });
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Arc(
                      edge: Edge.BOTTOM,
                      arcType: ArcType.CONVEY,
                      height: 14.0,
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: widget.movie.backdropPath),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 3,
                        top: AppConstant.smallPadding,
                        right: AppConstant.smallPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.movie.originalTitle,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          height: AppConstant.smallPadding,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.movie.voteAverage.toString(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: AppConstant.amberFFEF25,
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(
                                width: AppConstant.smallPadding,
                              ),
                              RatingBar.builder(
                                  itemCount: 10,
                                  ignoreGestures: true,
                                  initialRating: widget.movie.voteAverage,
                                  itemSize: 20,
                                  unratedColor: AppConstant.viewAllGray38,
                                  allowHalfRating: true,
                                  itemBuilder: (context, _) => const Icon(
                                        Icons.star_border_purple500,
                                        color: Colors.amber,
                                      ),
                                  onRatingUpdate: (rating) => {})
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppConstant.smallPadding,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Popularity",
                              style: textStyleDetail,
                            ),
                            SizedBox(
                              width: AppConstant.largePadding,
                            ),
                            Text(
                              widget.movie.popularity.toString(),
                              style: textStyleDetail,
                            )
                          ],
                        ),
                        SizedBox(
                          height: AppConstant.smallPadding,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Release date",
                              style: textStyleDetail,
                            ),
                            SizedBox(
                              width: AppConstant.largePadding,
                            ),
                            Text(
                              widget.movie.releaseDate,
                              style: textStyleDetail,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: backButtonWidget(context)),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: AppConstant.smallPadding),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0)),
                      child: CachedNetworkImage(
                        imageUrl: widget.movie.posterPath,
                        width: 107,
                        height: 163,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              if (videoList.isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoViewWidget(
                            videoList: videoList, videoIndex: 0)));
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: AppConstant.largePadding),
              height: 40.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: Colors.white),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/ic_play_button.png",
                    width: 10,
                    height: 11.5,
                  ),
                  SizedBox(
                    width: AppConstant.smallPadding / 2,
                  ),
                  const Text(
                    "Play",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppConstant.largePadding,
          ),
          StreamBuilder(
              stream: movieDetailViewModel.movieDetailController.stream,
              builder: (context, snapShot) {
                if (snapShot.hasData &&
                    snapShot.data?.genres?.isNotEmpty == true) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: snapShot.data?.genres?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 30.0,
                                margin: EdgeInsets.only(
                                    right: AppConstant.smallPadding),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: AppConstant.viewAllGray38)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppConstant.smallPadding),
                                  child: Text(
                                    snapShot.data!.genres![index].name,
                                    style: textStyleDetail,
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: AppConstant.largePadding,
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              }),
          const Text(
            "Overview",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppConstant.viewAllGray87,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: AppConstant.smallPadding,
          ),
          ExpandableText(
            widget.movie.overview,
            expandText: "Show more",
            collapseText: "Show "
                "less",
            maxLines: 3,
            style: textStyleDetail,
          ),
          StreamBuilder(
              stream: movieDetailViewModel.backdropListController.stream,
              builder: (context, snapShot) {
                if (snapShot.hasData && snapShot.data?.isNotEmpty == true) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppConstant.largePadding * 1.5,
                      ),
                      const Text("Photos",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppConstant.viewAllGray87,
                            decoration: TextDecoration.none,
                          )),
                      SizedBox(
                        height: AppConstant.smallPadding,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 107,
                        child: ListView.builder(
                            itemCount: 7,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Row(
                                  children: [
                                    if (index > 0) ...[
                                      SizedBox(
                                        width: AppConstant.smallPadding,
                                        height: double.infinity,
                                      )
                                    ],
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            snapShot.data![index].filePath,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ],
                                )),
                      )
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              }),
          StreamBuilder(
              stream: movieDetailViewModel.movieDetailController.stream,
              builder: (context, snapShot) {
                if (snapShot.hasData &&
                    snapShot.data != null &&
                    snapShot.data?.companies?.isNotEmpty == true) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppConstant.largePadding * 1.5,
                      ),
                      const Text("Companies",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppConstant.viewAllGray87,
                            decoration: TextDecoration.none,
                          )),
                      SizedBox(
                        height: AppConstant.smallPadding,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: ListView.builder(
                            itemCount: snapShot.data?.companies?.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Row(
                                  children: [
                                    if (index > 0) ...[
                                      SizedBox(
                                        width: AppConstant.largePadding,
                                        height: double.infinity,
                                      )
                                    ],
                                    if (snapShot.data!.companies![index].path
                                            ?.isNotEmpty ==
                                        true) ...[
                                      SizedBox(
                                        width: 90,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 110,
                                              child: CachedNetworkImage(
                                                imageUrl: snapShot.data!
                                                    .companies![index].path!,
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppConstant.smallPadding,
                                            ),
                                            Text(
                                              snapShot
                                                  .data!.companies![index].name,
                                              style: textStyleDetail,
                                              maxLines: 2,
                                            )
                                          ],
                                        ),
                                      )
                                    ] else ...[
                                      const SizedBox()
                                    ]
                                  ],
                                )),
                      )
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              })
        ],
      ),
    );
  }
}

import 'package:driver_license_test/constant/Constant.dart';
import 'package:driver_license_test/data/model/movie.dart';
import 'package:driver_license_test/ui/home/viewmodel/home_viewmodel.dart';
import 'package:driver_license_test/ui/home/widget/top_rated_movie_item.dart';
import 'package:driver_license_test/ui/home/widget/upcoming_movie_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController movieSearchController = TextEditingController();
  final FocusNode movieSearchFocusNode = FocusNode();
  String hintTextSearch = "Search...";
  late HomeViewModel viewModel;

  void initData() {
    viewModel = context.read<HomeViewModel>()
      ..getUpcomingMovies()
      ..getTopRatedMovies();
  }

  @override
  void initState() {
    // TODO: implement initState
    initData();
    movieSearchFocusNode.addListener(() {
      hintTextSearch = movieSearchFocusNode.hasFocus ? '' : "Search";
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstant.mediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppConstant.largePadding * 2.5,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/ic_netflix.png',
                    fit: BoxFit.fill,
                    width: 19.0,
                  ),
                  SizedBox(
                    width: AppConstant.mediumPadding,
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 50.0,
                    child: TextField(
                      controller: movieSearchController,
                      focusNode: movieSearchFocusNode,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        hintText: hintTextSearch,
                        hintStyle: const TextStyle(
                            fontSize: 14.0,
                            color: AppConstant.viewAllGray87,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: AppConstant.viewAllGray38,
                      ),
                      onChanged: (value) {},
                    ),
                  )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: AppConstant.largePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upcoming',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
                    ),
                    upcomingListWidget(),
                    SizedBox(
                      height: AppConstant.largePadding,
                    ),
                    const Text(
                      'Top rated',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
                    ),
                    topRatedListWidget()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget upcomingListWidget() {
    return StreamBuilder(
        stream: viewModel.upcomingMovieStreamController.stream,
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          if (snapShot.hasData) {
            final movies = snapShot.data as List<Movie>;
            return Padding(
              padding: EdgeInsets.only(top: AppConstant.smallPadding),
              child: SizedBox(
                width: double.infinity,
                height: 163.0,
                child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return (index > 0)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  left: AppConstant.smallPadding),
                              child: UpcomingMovieWidget(
                                movie: movies[index],
                              ),
                            )
                          : UpcomingMovieWidget(
                              movie: movies[index],
                            );
                    }),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }

  Widget topRatedListWidget() {
    return StreamBuilder(
        stream: viewModel.topRatedMovieStreamController.stream,
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          if (snapShot.hasData) {
            final movies = snapShot.data as List<Movie>;
            return Padding(
              padding: EdgeInsets.only(top: AppConstant.smallPadding),
              child: SizedBox(
                width: double.infinity,
                height: 163.0,
                child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return (index > 0)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  left: AppConstant.smallPadding),
                              child: TopRatedMovieWidget(
                                movie: movies[index],
                              ),
                            )
                          : TopRatedMovieWidget(
                              movie: movies[index],
                            );
                    }),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}

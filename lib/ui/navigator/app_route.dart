import 'package:driver_license_test/data/model/movie.dart';
import 'package:driver_license_test/ui/detail/screen/movie_detail_route.dart';
import 'package:driver_license_test/ui/home/screen/home_route.dart';
import 'package:flutter/material.dart';

Route appRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteConstant.HOME_ROUTE:
      return MaterialPageRoute(builder: (context) => HomeRoute.route);
    case RouteConstant.MOVIE_DETAIL_ROUTE:
      return MaterialPageRoute(
          builder: (context) =>
              MovieDetailRoute.route(settings.arguments as Movie));
    default:
      return MaterialPageRoute(builder: (_) => HomeRoute.route);
  }
}

class RouteConstant {
  static const HOME_ROUTE = "/home_route";
  static const MOVIE_DETAIL_ROUTE = "/movie_detail_route";
  static const VIDEO_VIEW_ROUTE = "/video_view_route";
}

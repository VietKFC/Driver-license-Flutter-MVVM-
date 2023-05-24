import 'package:driver_license_test/ui/home/screen/home_route.dart';
import 'package:driver_license_test/ui/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

Route appRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteConstant.HOME_ROUTE:
      return MaterialPageRoute(builder: (context) => HomeRoute.route);
    default:
      return MaterialPageRoute(builder: (_) => HomeRoute.route);
  }
}

class RouteConstant {
  static const HOME_ROUTE = "/home_route";
}

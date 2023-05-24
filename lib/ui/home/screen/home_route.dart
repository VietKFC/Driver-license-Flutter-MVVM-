import 'package:driver_license_test/ui/home/screen/home_screen.dart';
import 'package:driver_license_test/ui/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRoute {
  static Widget get route => Provider<HomeViewModel>(
        create: (context) => HomeViewModel(),
        builder: (context, child) => const HomeScreen(),
      );
}

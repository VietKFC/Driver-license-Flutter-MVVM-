import 'package:driver_license_test/config/environment.dart';
import 'package:driver_license_test/extension/theme_ext.dart';
import 'package:driver_license_test/ui/navigator/app_route.dart';
import 'package:driver_license_test/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'di/dependency_injection.dart';

void main() async {
  String environment = const String.fromEnvironment("ENVIRONMENT",
      defaultValue: Environment.DEV);
  Environment.instance.initConfig(environment);
  await dotenv.load(fileName: ".env");
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().getDarkTheme(context),
      onGenerateRoute: appRoute,
      home: const SplashScreen(),
    );
  }
}

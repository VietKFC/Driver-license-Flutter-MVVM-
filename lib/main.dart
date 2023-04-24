import 'package:driver_license_test/config/environment.dart';
import 'package:driver_license_test/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'di/dependency_injection.dart';

void main() async {
  String environment = const String.fromEnvironment("ENVIRONMENT",
      defaultValue: Environment.DEV);
  Environment.instance.initConfig(environment);
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

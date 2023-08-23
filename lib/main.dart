import 'package:dialog_in_flutter/core.dart';
import 'package:dialog_in_flutter/state_util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.navigatorKey,
      home: const DashboardView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/Dashboard.controller.dart';
import 'screens/Dashboard.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize the DashboardController
    Get.put(DashboardController());

    return const GetMaterialApp(
      home: DashboardScreen(),
    );
  }
}

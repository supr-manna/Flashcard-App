import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/di/di_service.dart' as di_service;
import 'data/controller/flashcard_controller.dart';
import 'data/route_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di_service.init();
  await Get.find<FlashcardController>().initializeHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteHelper.splashScreen,
      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 500),
      getPages: RouteHelper.routes,
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
    );
  }
}

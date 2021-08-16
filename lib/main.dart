import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openweather_api/app/routes/pages.dart';

import 'app/data/controllers/controllers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<WeatherController>(WeatherController());
  runApp(OpenweatherAPIApp());
}

class OpenweatherAPIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Openweather API Application',
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
    );
  }
}

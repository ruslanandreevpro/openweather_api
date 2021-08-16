import 'package:get/get.dart';
import 'package:openweather_api/app/ui/ui.dart';

part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => HomeUI()),
  ];
}

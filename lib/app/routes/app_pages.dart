import 'package:flutter_template/app/modules/weather/bindings/weather_binding.dart';
import 'package:flutter_template/app/modules/weather/views/weather_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.WEATHER;

  static final routes = [
    GetPage(
      name: Routes.WEATHER,
      page: () => WeatherView(),
      binding: WeatherBinding(),
    ),

  ];
}

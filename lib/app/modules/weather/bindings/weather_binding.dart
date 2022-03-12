import 'package:flutter_template/app/modules/weather/controllers/weather_controller.dart';
import 'package:get/get.dart';

//
import 'package:flutter_template/app/data/providers/weather_provider.dart';
import 'package:flutter_template/app/data/repositories/weather_repository.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WeatherController>(
      WeatherController(
        repository: WeatherRepository(
          apiClient: WeatherProvider(),
        ),
      ),
      permanent: true,
    );
  }
}

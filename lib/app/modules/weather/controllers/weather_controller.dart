import 'package:flutter_template/app/data/models/weather_model.dart';
import 'package:flutter_template/app/plugin/custom_calendar/src/date_picker_timeline.dart';
import 'package:flutter_template/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app/data/repositories/weather_repository.dart';

class WeatherController extends GetxController {
  final WeatherRepository repository;

  WeatherController({required this.repository});

  RxBool isProcessing = true.obs;
  RxBool isNoData = false.obs;

  final RxList<Weather> listWeather = RxList();

  DatePickerController datePickerController = DatePickerController();

  DateTime lastWeeks = DateTime.now().subtract(Duration(days: 7));

  final imageAssetLink = ''.obs;

  final averageHumidity = 0.obs;

  final averagePredictability = 0.obs;

  final averageTemperature = 0.0.obs;

  final Rx<String> weatherStateName = ''.obs;

  final Rx<DateTime> dateTimeSelected = DateTime.now().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getWeather(formatterPramsDate(DateTime.now()));

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String getImageAssetLink(String weatherStateName) {
    switch (weatherStateName) {
      case 'Snow':
        return 'sn';
      case 'Sleet':
        return 'sl';
      case 'Hail':
        return 'h';
      case 'Thunder Storm':
        return 't';
      case 'Heavy Rain':
        return 'hr';
      case 'Light Rain':
        return 'lr';
      case 'Showers':
        return 's';
      case 'Heavy Cloud':
        return 'hc';
      case 'Light Cloud':
        return 'lc';
      case 'Clear':
        return 'c';
      default:
        return '';
    }
  }

  String getWeatherStateName(WeatherStateName weatherStateName) {
    switch (weatherStateName) {
      case WeatherStateName.HEAVY_RAIN:
        return "Heavy Rain";
      case WeatherStateName.LIGHT_RAIN:
        return "Light Rain";
      case WeatherStateName.SHOWERS:
        return "Showers";
      case WeatherStateName.SNOW:
        return "Snow";
      case WeatherStateName.SLEET:
        return "Sleet";
      case WeatherStateName.HAIL:
        return "Hail";
      case WeatherStateName.THUNDER_STORM:
        return "Thunder Storm";
      case WeatherStateName.HEAVY_CLOUD:
        return "Heavy Cloud";

      case WeatherStateName.LIGHT_CLOUD:
        return "Light Cloud";
      case WeatherStateName.CLEAR:
        return "Clear";
      default:
        return 'Unknow';
    }
  }

  void resetValue(){
    listWeather.value = [];
    averageHumidity.value = 0;
    averagePredictability.value = 0;
    averageTemperature.value = 0;
  }

  void getAverageWeather() {
    final map = <String, int>{};
    listWeather.forEach((weather) {
      averageHumidity.value += weather.humidity!;
      averagePredictability.value += weather.predictability!;
      averageTemperature.value += weather.theTemp!.toDouble();
      map[getWeatherStateName(weather.weatherStateName!)] = map.containsKey(getWeatherStateName(weather.weatherStateName!))
          ? map[getWeatherStateName(weather.weatherStateName!)]! + 1: 1;
    });
    print(listWeather.length);
    averageHumidity.value = averageHumidity.value ~/ listWeather.length;
    averagePredictability.value = averagePredictability.value ~/ listWeather.length;
    averageTemperature.value = averageTemperature.value / listWeather.length;
    // Sort the list of the map keys weather state by the map values.
    final output = map.keys.toList(growable: false);
    output.sort((k1, k2) => map[k2]!.compareTo(map[k1]!.toInt()));
    weatherStateName.value = output[0];
  }

  Future<void> getWeather(String dateTime) async {
    resetValue();
    isProcessing.value = false;
    try {
      listWeather.value = await repository.getWeather(dateTime) ?? [];
      if (listWeather.isEmpty) {
        isNoData.value = true;
      }
      else{
        isNoData.value = false;
        getAverageWeather();
      }
      isProcessing.value = true;
    } catch (e) {
      isProcessing.value = true;
      Get.snackbar(
        'asd',
        'Cannot get information of weather',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
    }
  }
}

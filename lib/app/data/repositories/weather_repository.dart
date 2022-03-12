import 'package:flutter_template/app/data/models/weather_model.dart';
import 'package:flutter_template/app/data/providers/weather_provider.dart';

class WeatherRepository {
  final WeatherProvider apiClient;

  WeatherRepository({required this.apiClient});

  Future<List<Weather>?> getWeather(String dateTime) async {
    return apiClient.getLocationWeather(dateTime);
  }

}

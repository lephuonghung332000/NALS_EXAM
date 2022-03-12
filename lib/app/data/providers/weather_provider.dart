import 'package:flutter_template/app/data/models/weather_model.dart';

import 'package:flutter_template/app/settings/endpoints.dart';
import 'package:flutter_template/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class WeatherProvider extends GetConnect {
  Future<List<Weather>?> getLocationWeather(String dateTime) async {
    try {
      final url = "${Endpoints.GET_WEATHER}/$dateTime";
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return weatherFromJson(response.body);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}

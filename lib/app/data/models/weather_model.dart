class Weather {
  Weather({
    this.id,
    this.weatherStateName,
    this.weatherStateAbbr,
    this.windDirectionCompass,
    this.created,
    this.applicableDate,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.windSpeed,
    this.windDirection,
    this.airPressure,
    this.humidity,
    this.visibility,
    this.predictability,
  });

  int? id;
  WeatherStateName? weatherStateName;
  WeatherStateAbbr? weatherStateAbbr;
  WindDirectionCompass? windDirectionCompass;
  DateTime? created;
  DateTime? applicableDate;
  double? minTemp;
  double? maxTemp;
  double? theTemp;
  double? windSpeed;
  double? windDirection;
  double? airPressure;
  int? humidity;
  double? visibility;
  int? predictability;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        weatherStateName: weatherStateNameValues.map?[json["weather_state_name"]],
        weatherStateAbbr: weatherStateAbbrValues.map?[json["weather_state_abbr"]],
        windDirectionCompass: windDirectionCompassValues.map?[json["wind_direction_compass"]],
        created: DateTime.parse(json["created"]),
        applicableDate: DateTime.parse(json["applicable_date"]),
        minTemp: json["min_temp"] == null ? null : json["min_temp"].toDouble(),
        maxTemp: json["max_temp"] == null ? null : json["max_temp"].toDouble(),
        theTemp: json["the_temp"] == null ? null : json["the_temp"].toDouble(),
        windSpeed: json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDirection: json["wind_direction"] == null ? null : json["wind_direction"].toDouble(),
        airPressure: json["air_pressure"] == null ? null : json["air_pressure"].toDouble(),
        humidity: json["humidity"],
        visibility: json["visibility"] == null ? null : json["visibility"].toDouble(),
        predictability: json["predictability"] ,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weather_state_name": weatherStateNameValues.reverse[weatherStateName],
        "weather_state_abbr": weatherStateAbbrValues.reverse[weatherStateAbbr],
        "wind_direction_compass": windDirectionCompassValues.reverse[windDirectionCompass],
        "created": created.toString(),
        "applicable_date": "${applicableDate?.year.toString().padLeft(4, '0')}-${applicableDate?.month.toString().padLeft(2, '0')}-${applicableDate?.day.toString().padLeft(2, '0')}",
        "min_temp": minTemp,
        "max_temp": maxTemp,
        "the_temp": theTemp,
        "wind_speed": windSpeed,
        "wind_direction": windDirection,
        "air_pressure": airPressure,
        "humidity": humidity,
        "visibility": visibility,
        "predictability": predictability,
      };
}

enum WeatherStateAbbr { HR, LR, S, SN, SL, H, T, HC, LC, C }

final weatherStateAbbrValues = EnumValues({
  "hr": WeatherStateAbbr.HR,
  "lr": WeatherStateAbbr.LR,
  "s": WeatherStateAbbr.S,
  "sn": WeatherStateAbbr.SN,
  "sl": WeatherStateAbbr.SL,
  "h": WeatherStateAbbr.H,
  "t": WeatherStateAbbr.T,
  "hc": WeatherStateAbbr.HC,
  "lc": WeatherStateAbbr.LC,
  "c": WeatherStateAbbr.C,
});

enum WeatherStateName {
  HEAVY_RAIN,
  LIGHT_RAIN,
  SHOWERS,
  SNOW,
  SLEET,
  HAIL,
  THUNDER_STORM,
  HEAVY_CLOUD,
  LIGHT_CLOUD,
  CLEAR,
}

final weatherStateNameValues = EnumValues({
  "Heavy Rain": WeatherStateName.HEAVY_RAIN,
  "Light Rain": WeatherStateName.LIGHT_RAIN,
  "Showers": WeatherStateName.SHOWERS,
  "Snow": WeatherStateName.SNOW,
  "Sleet": WeatherStateName.SLEET,
  "Hail": WeatherStateName.HAIL,
  "Thunder Storm": WeatherStateName.THUNDER_STORM,
  "Heavy Cloud": WeatherStateName.HEAVY_CLOUD,
  "Light Cloud": WeatherStateName.LIGHT_CLOUD
});

enum WindDirectionCompass { WSW, W, SW, N, NE, E, SE, S, NW,ESE,SSE,NNE }

final windDirectionCompassValues = EnumValues({
  "SW": WindDirectionCompass.SW,
  "W": WindDirectionCompass.W,
  "WSW": WindDirectionCompass.WSW,
  "N": WindDirectionCompass.N,
  "NE": WindDirectionCompass.NE,
  "E": WindDirectionCompass.E,
  "SE": WindDirectionCompass.SE,
  "S": WindDirectionCompass.S,
  "NW": WindDirectionCompass.NW,
  "ESE": WindDirectionCompass.ESE,
  "SSE": WindDirectionCompass.SSE,
  "NNE": WindDirectionCompass.NNE,
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}

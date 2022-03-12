import 'dart:convert';
import 'package:intl/intl.dart';

import '../data/models/weather_model.dart';

//decode list json
List<Weather> weatherFromJson(String responseBody) {
  final parsed = jsonDecode(responseBody) ;
  return  List<Weather>.from(parsed.map((model)=> Weather.fromJson(model)));
}

// Format date
final _formatterPramsDate = DateFormat('yyyy/MM/dd');
final _formatterDisplayDate =  DateFormat("EE MMM d, yyyy");


String formatterPramsDate(DateTime dateTime) =>
    _formatterPramsDate.format(dateTime);

String formatterDisplayDate(DateTime dateTime) =>
    _formatterDisplayDate.format(dateTime);

bool checkIfToday(DateTime dateTime) {
  DateTime now = DateTime.now();
  return dateTime.day == now.day &&
      dateTime.month == now.month &&
      dateTime.year == dateTime.year;
}

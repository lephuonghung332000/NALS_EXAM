/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
/// ***

import 'package:flutter/material.dart';
import 'package:flutter_template/app/theme/theme.dart';
import 'package:flutter_template/app/utils/utils.dart';
import 'package:intl/intl.dart';

import 'gestures/tap.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: selectionColor,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: <Color>[
                kColorWeatherTimeLine,
                kColorHighLight,
              ],
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                  checkIfToday(date)
                      ? 'Today'
                      : DateFormat("E", locale).format(date), // WeekDay
                  style: dayTextStyle),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: Text('${DateFormat("M", locale).format(date)}/${date.day}',
                  style: dateTextStyle),
            ),
          ],
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(this.date);
        }
      },
    );
  }
}

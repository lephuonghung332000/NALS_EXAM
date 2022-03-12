import 'package:flutter/material.dart';
import 'package:flutter_template/app/enums/enums.dart';
import 'package:flutter_template/app/modules/weather/widgets/progress_painter.dart';
import 'package:flutter_template/app/theme/theme.dart';

class LocatorKeyWidget extends StatelessWidget {
  const LocatorKeyWidget({
    Key? key,
    required this.valueMeteorology,
    required this.meteorology,
  }) : super(key: key);
  final int valueMeteorology;
  final METEOROLOGY meteorology;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 270,
      width: 160,
      decoration: BoxDecoration(
          color: meteorology == METEOROLOGY.HUMIDITY
              ? kColorHumidity
              : kColorPredictability,
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 120,
              height: 120,
              child: TweenAnimationBuilder(
                duration: const Duration(seconds: 3),
                tween: Tween(begin: 0.0, end: valueMeteorology / 100),
                curve: Curves.easeOutCubic,
                builder: (_, dynamic value, __) {
                  return CustomPaint(
                    painter: ProgressPainter(
                        total: 100,
                        color: meteorology == METEOROLOGY.HUMIDITY
                            ? kColorHumidity
                            : kColorPredictability,
                        value: value),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$valueMeteorology',
                        style: kValueHumidityAndPredictability,
                      ),
                      TextSpan(text: ' %',style: kPercentHumidityAndPredictability)
                    ],
                  ),
                ),
              SizedBox(height: 10),
              Text(meteorology == METEOROLOGY.HUMIDITY
                  ? 'Humidity'
                  : 'Predictability', style: kHumidityAndPredictability),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

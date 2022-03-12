import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/app/enums/enums.dart';
import 'package:flutter_template/app/modules/weather/controllers/weather_controller.dart';
import 'package:flutter_template/app/modules/weather/widgets/locator_key_widget.dart';
import 'package:flutter_template/app/plugin/custom_calendar/src/date_picker_widget.dart';
import 'package:flutter_template/app/theme/theme.dart';
import 'package:flutter_template/app/utils/utils.dart';
import 'package:flutter_template/app/widgets/loading_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class WeatherView extends GetView<WeatherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              DatePicker(
                controller.lastWeeks,
                width: Get.width * 0.15,
                height: Get.height * 0.07,
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.white,
                selectedTextColor: Colors.white,
                datePickerController: controller.datePickerController,
                onDateChange: (date) {
                  controller.dateTimeSelected.value = date;
                  controller.getWeather(
                      formatterPramsDate(controller.dateTimeSelected.value));
                },
              ),
              Expanded(
                child: Stack(
                  children: [
                    !controller.isProcessing
                            .value //kiem tra xem dang loading hay chua
                        ? Center(child: LoadingWidget())
                        : controller
                                .isNoData.value //kiem tra list rong hay khong
                            ? Center(child: Text('No Data'))
                            : RefreshIndicator(
                                onRefresh: () {
                                  return controller.getWeather(formatterPramsDate(controller.dateTimeSelected.value));
                                },
                                child:LayoutBuilder(
                                  builder: (context,constraint){
                                    return  SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(
                                          parent: AlwaysScrollableScrollPhysics()),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(minHeight: constraint.maxHeight),
                                        child: IntrinsicHeight(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: Get.height * 0.03,
                                              ),
                                              SvgPicture.asset(
                                                'assets/images/${controller.getImageAssetLink(controller.weatherStateName.value)}.svg',
                                                width: 100,
                                                height: 70,
                                                fit: BoxFit.contain,
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.04,
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: '${controller.averageTemperature.value.toInt()}°',
                                                      style: kTextTemperature,
                                                    ),
                                                    TextSpan(text: 'C',style: kTextCelsius)
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.02,
                                              ),
                                              Text(
                                                 controller.weatherStateName.value,
                                                  style: kWeatherStateAbbr,
                                                  textAlign: TextAlign.center),
                                              SizedBox(
                                                height: Get.height * 0.04,
                                              ),
                                              Container(
                                                width: 200,
                                                child: Text(
                                                    formatterDisplayDate(controller.dateTimeSelected.value),
                                                    style: kDisplaySelectionDay,
                                                    textAlign: TextAlign.center),
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.06,
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsets.symmetric(horizontal: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    LocatorKeyWidget(
                                                        meteorology:
                                                        METEOROLOGY.HUMIDITY,
                                                        valueMeteorology: controller.averageHumidity.value),
                                                    LocatorKeyWidget(
                                                        meteorology:
                                                        METEOROLOGY.PREDICTABILITY,
                                                        valueMeteorology:  controller.averagePredictability.value),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

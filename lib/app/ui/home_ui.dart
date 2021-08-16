import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openweather_api/app/data/controllers/controllers.dart';

class HomeUI extends StatelessWidget {
  final WeatherController _weatherController = WeatherController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(() => _weatherController.isLoad.value
        ? Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Максимальное давление за предстоящие 5 дней:',
                    textAlign: TextAlign.center,
                  ),
                  Text(_weatherController.maxPressure.value.toString()),
                  SizedBox(height: 24.0),
                  Text(
                    'День с минимальной разницей между ночной и утренней температурой:',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  Text('Дата: ${_weatherController.dateOfMinTempDiff.value}'),
                  Text('Ночная температура: ${(_weatherController.tempNight[_weatherController.minTempDiffIndex.value!] - 273.15).toStringAsFixed(1)}'),
                  Text('Утренняя температура: ${(_weatherController.tempMorn[_weatherController.minTempDiffIndex.value!] - 273.15).toStringAsFixed(1)}'),
                ],
              ),
            ),
          )
        : Scaffold());
    }
}

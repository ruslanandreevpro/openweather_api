import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:openweather_api/app/core/constants/constants.dart';
import 'package:openweather_api/app/core/helpers/helpers.dart';
import 'package:openweather_api/app/core/helpers/loading_helper.dart';
import 'package:openweather_api/app/data/models/models.dart';

class WeatherController extends GetxController {
  static WeatherController to = Get.find();

  Rxn<WeatherModel> weatherData = Rxn<WeatherModel>();
  RxBool isLoad = RxBool(false);
  Rxn<int> minTempDiffIndex = Rxn<int>();
  Rxn<int> maxPressure = Rxn<int>();
  Rxn<double> minTempDiff = Rxn<double>();
  Rxn<String> dateOfMinTempDiff = Rxn<String>();

  List<int> pressureList = [0, 0, 0, 0, 0].obs;
  List<double> tempDiff = [0.0, 0.0, 0.0, 0.0, 0.0].obs;
  List<double> tempNight = [0.0, 0.0, 0.0, 0.0, 0.0].obs;
  List<double> tempMorn = [0.0, 0.0, 0.0, 0.0, 0.0].obs;
  List<int> dateList = [0, 0, 0, 0, 0].obs;

  @override
  onReady() async {
    isLoad.value = false;
    await getCityWeather();
    super.onReady();
  }

  void findMinTempDiffIndex(List<double> tempDiff) {
    minTempDiffIndex.value = tempDiff.indexOf(tempDiff.reduce(min));
  }

  void findMaxPressure() {
    maxPressure.value = pressureList.reduce(max);
  }

  void getDateOfMinTempDiff() {
    int timeInMillis = dateList[minTempDiffIndex.value!];
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis * 1000);
    dateOfMinTempDiff.value = DateFormat('dd.MM.yyyy').format(date);
  }

  void findMinTempDiff() {
    minTempDiff.value = tempDiff.reduce(min);
  }

  Future<void> getCityWeather() async {
    showLoading();
    NetworkHelper networkHelper = NetworkHelper(OpenweatherAPI.openweatherURL);
    var data = await networkHelper.getData();
    weatherData.value = WeatherModel.fromMap(jsonDecode(data));
    isLoad.value = true;
    pressureList[0] = weatherData.value!.pressure0;
    pressureList[1] = weatherData.value!.pressure1;
    pressureList[2] = weatherData.value!.pressure2;
    pressureList[3] = weatherData.value!.pressure3;
    pressureList[4] = weatherData.value!.pressure4;
    tempNight[0] = weatherData.value!.temperatureNight0;
    tempNight[1] = weatherData.value!.temperatureNight1;
    tempNight[2] = weatherData.value!.temperatureNight2;
    tempNight[3] = weatherData.value!.temperatureNight3;
    tempNight[4] = weatherData.value!.temperatureNight4;
    tempMorn[0] = weatherData.value!.temperatureMorn0;
    tempMorn[1] = weatherData.value!.temperatureMorn1;
    tempMorn[2] = weatherData.value!.temperatureMorn2;
    tempMorn[3] = weatherData.value!.temperatureMorn3;
    tempMorn[4] = weatherData.value!.temperatureMorn4;
    var diff0 = weatherData.value!.temperatureNight0 - weatherData.value!.temperatureMorn0;
    var diff1 = weatherData.value!.temperatureNight1 - weatherData.value!.temperatureMorn1;
    var diff2 = weatherData.value!.temperatureNight2 - weatherData.value!.temperatureMorn2;
    var diff3 = weatherData.value!.temperatureNight3 - weatherData.value!.temperatureMorn3;
    var diff4 = weatherData.value!.temperatureNight4 - weatherData.value!.temperatureMorn4;
    tempDiff[0] = diff0;
    tempDiff[1] = diff1;
    tempDiff[2] = diff2;
    tempDiff[3] = diff3;
    tempDiff[4] = diff4;
    dateList[0] = weatherData.value!.dt0;
    dateList[1] = weatherData.value!.dt1;
    dateList[2] = weatherData.value!.dt2;
    dateList[3] = weatherData.value!.dt3;
    dateList[4] = weatherData.value!.dt4;
    findMinTempDiffIndex(tempDiff);
    findMaxPressure();
    findMinTempDiff();
    getDateOfMinTempDiff();
    dismissLoadingWidget();
  }
}
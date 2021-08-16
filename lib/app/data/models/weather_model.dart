class WeatherModel {
  final int pressure0;
  final int pressure1;
  final int pressure2;
  final int pressure3;
  final int pressure4;
  final double temperatureNight0;
  final double temperatureNight1;
  final double temperatureNight2;
  final double temperatureNight3;
  final double temperatureNight4;
  final double temperatureMorn0;
  final double temperatureMorn1;
  final double temperatureMorn2;
  final double temperatureMorn3;
  final double temperatureMorn4;
  final int dt0;
  final int dt1;
  final int dt2;
  final int dt3;
  final int dt4;

  WeatherModel({
    required this.pressure0,
    required this.pressure1,
    required this.pressure2,
    required this.pressure3,
    required this.pressure4,
    required this.temperatureNight0,
    required this.temperatureNight1,
    required this.temperatureNight2,
    required this.temperatureNight3,
    required this.temperatureNight4,
    required this.temperatureMorn0,
    required this.temperatureMorn1,
    required this.temperatureMorn2,
    required this.temperatureMorn3,
    required this.temperatureMorn4,
    required this.dt0,
    required this.dt1,
    required this.dt2,
    required this.dt3,
    required this.dt4,
  });

  factory WeatherModel.fromMap(Map data) {
    return WeatherModel(
      pressure0: data['daily'][0]['pressure'],
      pressure1: data['daily'][1]['pressure'],
      pressure2: data['daily'][2]['pressure'],
      pressure3: data['daily'][3]['pressure'],
      pressure4: data['daily'][4]['pressure'],
      temperatureNight0: data['daily'][0]['temp']['night'],
      temperatureNight1: data['daily'][1]['temp']['night'],
      temperatureNight2: data['daily'][2]['temp']['night'],
      temperatureNight3: data['daily'][3]['temp']['night'],
      temperatureNight4: data['daily'][4]['temp']['night'],
      temperatureMorn0: data['daily'][0]['temp']['morn'],
      temperatureMorn1: data['daily'][1]['temp']['morn'],
      temperatureMorn2: data['daily'][2]['temp']['morn'],
      temperatureMorn3: data['daily'][3]['temp']['morn'],
      temperatureMorn4: data['daily'][4]['temp']['morn'],
      dt0: data['daily'][0]['dt'],
      dt1: data['daily'][1]['dt'],
      dt2: data['daily'][2]['dt'],
      dt3: data['daily'][3]['dt'],
      dt4: data['daily'][4]['dt'],
    );
  }
}
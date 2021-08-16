class OpenweatherAPI {
  static const String openweatherApiKey='ac2ff6cde91a17589217974633f45c2b';
  static const String city='Izhevsk';
  static const String lat='56.850';
  static const String lon='53.233';
  static const String units='metric';
  static const String lang='ru';
  static const String openweatherURL='https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$openweatherApiKey';
}
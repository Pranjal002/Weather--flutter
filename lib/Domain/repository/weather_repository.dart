import 'package:weatherstation/Domain/Model/weather_response_model.dart';

import '../Model/weather_data_model.dart';

abstract class WeatherRepositoryCollection{
  Future<List<WeatherData>> getWeatherData();
}
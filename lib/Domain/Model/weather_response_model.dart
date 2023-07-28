import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part '../../core/gen/Domain/Model/weather_response_model.freezed.dart';
part '../../core/gen/Domain/Model/weather_response_model.g.dart';

@freezed
List<WeatherData> getWeatherDataFromJson(String weather)=>
List<WeatherData>.from(jsonDecode(weather).map((x)=>WeatherData.fromJson(x)));
abstract class WeatherData with _$WeatherData {
  factory WeatherData({
    @JsonKey(name: 'information_id') required int? informationId,
    @JsonKey(name: 'device_name') required String? deviceName,
    required double? tempf,
    required int? humidity,
    required double? dewptf,
    required int? winddir,
    required double? windspeedmph,
    required double? windgustmph,
    required double? rainin,
    required double? dailyrainin,
    required double? weeklyrainin,
    required double? monthlyrainin,
    required double? yearlyrainin,
    required double? solarradiation,
    required int? UV,
    required double? baromin,
    required double? indoortempf,
    required int? indoorhumidity,
    required String? dateutc,
    required String? softwaretype,
    required String? realtime,
    required String? action,
    required String? rtfreq,
    required String? battery,
    required String? created_at,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}

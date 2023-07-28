// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../Domain/Model/weather_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherData _$$_WeatherDataFromJson(Map<String, dynamic> json) =>
    _$_WeatherData(
      informationId: json['information_id'] as int?,
      deviceName: json['device_name'] as String?,
      tempf: (json['tempf'] as num?)?.toDouble(),
      humidity: json['humidity'] as int?,
      dewptf: (json['dewptf'] as num?)?.toDouble(),
      winddir: json['winddir'] as int?,
      windspeedmph: (json['windspeedmph'] as num?)?.toDouble(),
      windgustmph: (json['windgustmph'] as num?)?.toDouble(),
      rainin: (json['rainin'] as num?)?.toDouble(),
      dailyrainin: (json['dailyrainin'] as num?)?.toDouble(),
      weeklyrainin: (json['weeklyrainin'] as num?)?.toDouble(),
      monthlyrainin: (json['monthlyrainin'] as num?)?.toDouble(),
      yearlyrainin: (json['yearlyrainin'] as num?)?.toDouble(),
      solarradiation: (json['solarradiation'] as num?)?.toDouble(),
      UV: json['UV'] as int?,
      baromin: (json['baromin'] as num?)?.toDouble(),
      indoortempf: (json['indoortempf'] as num?)?.toDouble(),
      indoorhumidity: json['indoorhumidity'] as int?,
      dateutc: json['dateutc'] as String?,
      softwaretype: json['softwaretype'] as String?,
      realtime: json['realtime'] as String?,
      action: json['action'] as String?,
      rtfreq: json['rtfreq'] as String?,
      battery: json['battery'] as String?,
      created_at: json['created_at'] as String?,
    );

Map<String, dynamic> _$$_WeatherDataToJson(_$_WeatherData instance) =>
    <String, dynamic>{
      'information_id': instance.informationId,
      'device_name': instance.deviceName,
      'tempf': instance.tempf,
      'humidity': instance.humidity,
      'dewptf': instance.dewptf,
      'winddir': instance.winddir,
      'windspeedmph': instance.windspeedmph,
      'windgustmph': instance.windgustmph,
      'rainin': instance.rainin,
      'dailyrainin': instance.dailyrainin,
      'weeklyrainin': instance.weeklyrainin,
      'monthlyrainin': instance.monthlyrainin,
      'yearlyrainin': instance.yearlyrainin,
      'solarradiation': instance.solarradiation,
      'UV': instance.UV,
      'baromin': instance.baromin,
      'indoortempf': instance.indoortempf,
      'indoorhumidity': instance.indoorhumidity,
      'dateutc': instance.dateutc,
      'softwaretype': instance.softwaretype,
      'realtime': instance.realtime,
      'action': instance.action,
      'rtfreq': instance.rtfreq,
      'battery': instance.battery,
      'created_at': instance.created_at,
    };

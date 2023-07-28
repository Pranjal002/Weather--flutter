class WeatherModel {
  final int information_id;
  final String device_name;
  final double tempf;
  final double humidity;
  final double dewptf;
  final double winddirection;
  final double windspeedmph;
  final double windgustmph;
  final double rainin;
  final double dailyrainin;
  final double weeklurainin;
  final double yearlyrainin;
  final double solarradiation;
  final int UV;
  final double baromin;
  final double indoortempf;
  final double indoorhumidity;
  final String dateutc;
  final String softwaretype;
  final String realtime;
  final String action;
  final String rtfeq;
  final String battery;
  final String created_at;

  WeatherModel(
      {required this.information_id,
      required this.device_name,
      required this.tempf,
      required this.humidity,
      required this.dewptf,
      required this.winddirection,
      required this.windspeedmph,
      required this.windgustmph,
      required this.rainin,
      required this.dailyrainin,
      required this.weeklurainin,
      required this.yearlyrainin,
      required this.solarradiation,
      required this.UV,
      required this.baromin,
      required this.indoortempf,
      required this.indoorhumidity,
      required this.dateutc,
      required this.softwaretype,
      required this.realtime,
      required this.action,
      required this.rtfeq,
      required this.battery,
      required this.created_at});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        information_id: json['information_id'],
        device_name: json['device_name'],
        tempf: json['tempf'],
        humidity: double.tryParse(json['humidity'].toString()) ?? 0,
        dewptf: json['dewptf'],
        winddirection: json['winddirection'],
        windspeedmph: json['windspeedmph'],
        windgustmph: json['windgustmph'],
        rainin: json['rainin'],
        dailyrainin: json['dailyrainin'],
        weeklurainin: json['weeklyrainin'],
        yearlyrainin: json['yearlyrainin'],
        solarradiation: json['solarradiation'],
        UV: json['UV'],
        baromin: json['baromin'],
        indoortempf: json['indoortempf'],
        indoorhumidity: json['indoorhumidity'],
        dateutc: json['dateutc'],
        softwaretype: json['softwaretype'],
        realtime: json['realtime'],
        action: json['action'],
        rtfeq: json['rtfeq'],
        battery: json['battery'],
        created_at: json['created_at']);
  }
}

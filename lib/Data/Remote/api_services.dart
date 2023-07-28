import 'dart:convert';
import 'dart:io'; // Add the 'dart:io' import for the SocketException

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weatherstation/Data/Remote/weather_data.dart';
import 'package:weatherstation/Domain/Model/weather_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:weatherstation/Domain/Model/weather_response_model.dart';
part '../../core/gen/Data/Remote/api_services.g.dart';


@RestApi(baseUrl:'http://202.52.240.148:8094/weatherapi/public/api/')

abstract class ApiServices{
  factory ApiServices(Dio dio)= _ApiServices;
  @GET('informations')
  Future<List<WeatherData>> getWeatherData();
}
// class ApiServices {
//   Future<List<WeatherModel>> getWeatherData() async {
//     try {
//       final response = await http.get(Uri.parse(
//           'http://202.52.240.148:8094/weatherapi/public/api/informations'));
//       var data= jsonDecode(response.body.toString());
//       if (data is List) {
//         List<WeatherModel> weather =[];
//         for(Map<String,dynamic> item in data){
//           weather.add(WeatherModel.fromJson(item));
//         }
//         return weather;
//       } else {
//         print("Error response code : ${response.statusCode}");
//         return []; // Assuming WeatherMel has a default constructor
//       }
//     } on SocketException {
//       print('No internet connection');
//       throw Exception("Error in data");
//     } catch (e, stackTrace) {
//       print('Exception occurred: $e\n$stackTrace');
//       throw Exception("Error in data");
//     }
//   }
// }

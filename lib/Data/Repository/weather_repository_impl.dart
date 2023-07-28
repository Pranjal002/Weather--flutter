import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:weatherstation/Data/Remote/api_services.dart';
import 'package:weatherstation/Domain/Model/weather_data_model.dart';
import 'package:weatherstation/Domain/repository/weather_repository.dart';
import 'package:weatherstation/core/err_exc/exception.dart';

import '../../Domain/Model/weather_response_model.dart';
import '../../core/err_exc/except.dart';

class WeatherRepositoryCollectionImpl extends WeatherRepositoryCollection{

  @override
  Future<List<WeatherData>> getWeatherData() async {
    var response =await rootBundle.loadString("assets/local.json");
    if(response.isNotEmpty){
      return getWeatherDataFromJson(response);
    }else{
      return [];
    }

  }


  //   ApiServices apiServices = ApiServices(Dio(BaseOptions(contentType:'application/json')));
  //   log('dfsa');
  //   return safeApiCall(()async{
  //     return await apiServices.getWeatherData();
  //   });
  // }

}



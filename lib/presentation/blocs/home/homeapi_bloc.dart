import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weatherstation/Data/Repository/weather_repository_impl.dart';
import 'package:weatherstation/Domain/Model/weather_response_model.dart';

import '../../../Domain/Model/weather_data_model.dart';

class HomeapiBloc extends Bloc<HomeapiEvent, HomeapiState> {
  WeatherRepositoryCollectionImpl weatherRepositoryCollectionImpl =
      WeatherRepositoryCollectionImpl();

  HomeapiBloc() : super(HomeapiInitial()) {
    on<HomeFetchEvent>((event, emit) async {
      emit(HomeapiLoadingState());
      try {
        log('fasadf');
        final model = await weatherRepositoryCollectionImpl.getWeatherData();
        log('dfsaf');

        emit(HomeapiLoadedState(weatherModel: model));
      } on SocketException {
        emit(HomeapiFailedState(message: 'failed'));
      } catch (e) {
        emit(HomeapiFailedState(message: e.toString()));
      }
    });
  }
}

//------------------------HomeAPIEvent-----------------------------------------
abstract class HomeapiEvent {}

class HomeFetchEvent extends HomeapiEvent {}

//---------------------------HomeapiState-------------------------------------
abstract class HomeapiState extends Equatable {}

class HomeapiInitial extends HomeapiState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeapiFailedState extends HomeapiState {
  final String message;
  HomeapiFailedState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class HomeapiLoadedState extends HomeapiState {
  final List<WeatherData> weatherModel;
  HomeapiLoadedState({required this.weatherModel});
  @override
  // TODO: implement props
  List<Object?> get props => [weatherModel];
}

class HomeapiLoadingState extends HomeapiState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

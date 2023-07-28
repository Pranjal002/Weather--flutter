import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
class ServerException extends Equatable implements Exception{
  final String? errorMsg;
  const ServerException(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];

}
class NoConnectionException implements Exception{

}
class UnauthorizedException implements Exception{

}
class CancellationException implements Exception{

  final String? message;
  CancellationException({required this.message});
}
class PermissionDeniedException implements Exception{}
class CacheException implements Exception{}
class UnknownException implements Exception{
  final String message;
  UnknownException({required this.message});
}
class NoInternetException implements Exception{
  NoInternetException();
}
class TimeOutException implements Exception{
  TimeOutException();

}
class DateFormatException implements Exception{}






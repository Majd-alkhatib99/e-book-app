import 'package:dio/dio.dart';

abstract class Failures{
  String errorMessage;
  Failures(this.errorMessage);
}

class ServerFailures extends Failures{
  ServerFailures(super.errorMessage);

  factory ServerFailures.fromDioError(DioException dioException){
    switch (dioException.type){
      case DioExceptionType.connectionTimeout:
      return ServerFailures('Connection time out with AppServe');
      case DioExceptionType.sendTimeout:
        return ServerFailures('Send time out with AppServe');
      case DioExceptionType.receiveTimeout:
        return ServerFailures('Receive time out with AppServe');
      case DioExceptionType.badCertificate:
        return ServerFailures('Connection time out with AppServe');
      case DioExceptionType.badResponse:
        return ServerFailures.fromResponse(dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailures('request with AppServe was canceled');
      case DioExceptionType.connectionError:
        return ServerFailures('Connection error with AppServe');
      case DioExceptionType.unknown:
        if(dioException.message=='SocketException'){
          return ServerFailures('No internet connection, Please try again!');
        }
        return ServerFailures('Unexpected error< Please try again!');

      default: return ServerFailures('Opps there was ann error, Please try later!');
    }

  }

  factory ServerFailures.fromResponse(int statusCode, dynamic response){
    if(statusCode ==400 || statusCode ==401 || statusCode ==403){
      print(response['error']['message']);
      print('5555 \n \n ');
      return ServerFailures(response['error']['message']);
    }else if(statusCode ==404){
      return ServerFailures('Yor Request is not found, Please try later!');
    }else if(statusCode ==500){
      return ServerFailures('Internal server error, Please try later!');
    }else{
      return ServerFailures('Opps there was ann error, Please try later!');
    }
  }

}
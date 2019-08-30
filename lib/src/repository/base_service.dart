
import 'package:dio/dio.dart';

class BaseService extends Dio {

  BaseService() {
    options.baseUrl = "https://unsplash.com/napi";
    options.connectTimeout = 5000;
    options.receiveTimeout = 3000;
  }
}
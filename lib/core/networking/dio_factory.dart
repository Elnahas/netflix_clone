import 'package:dio/dio.dart';
import 'package:netflix_clone/core/networking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {

  final Dio dio;

  DioFactory({required this.dio}) {
    _initializeDio();
  }

  void _initializeDio() {
    const Duration timeout = Duration(seconds: 30);

    dio
      ..options.connectTimeout = timeout
      ..options.receiveTimeout = timeout;

    _addDioHeaders();
    _addDioInterceptor();
  }

  void _addDioHeaders() async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiConstants.userToken}',
    };
  }

  void _addDioInterceptor() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}

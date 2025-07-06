import 'package:dio/dio.dart';
import 'package:e_commerece_online_c13/core/api/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class ApiManager {
  final dio = Dio()..interceptors.add(CustomDioLogger());

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.get(
      ApiConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(
  validateStatus: (status) => true,
      ),
    );
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) {
    return dio.post(
      ApiConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      data: body, options: Options(
  validateStatus: (status) => true,
      ),
    );
  }
}

class CustomDioLogger extends PrettyDioLogger {
  final bool requestHeader, requestBody, responseBody, error, compact;
  final int maxWidth;
  CustomDioLogger({
    this.requestHeader = false,
    this.requestBody = false,
    this.responseBody = true,
    this.error = true,
    this.compact = true,
    this.maxWidth = 90,
  }) : super(
          requestHeader: requestHeader,
          requestBody: requestBody,
          responseBody: responseBody,
          error: error,
          compact: compact,
          maxWidth: maxWidth,
        );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      logPrint('🔴 Response Data: ${err.response?.data}');
      logPrint('🔴 Status Code: ${err.response?.statusCode}');
      logPrint('🔴 Headers: ${err.response?.headers}');
    } else if (err.message != null) {
      logPrint('🔴 Error Message: ${err.message}');
    } else {
      logPrint('🔴 Error Details: ${err.error}');
    }
    super.onError(err, handler);
  }
}

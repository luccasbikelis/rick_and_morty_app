import 'package:rick_and_morty_app/share/boundaries/http_connection/http_facade.dart';
import 'package:dio/dio.dart';
import 'exception/exception_status/exception.dart';

class HttpFacadeImpl implements HttpFacade {
  final Dio _dio;

  HttpFacadeImpl(
    this._dio,
  );

  @override
  call(HttpMethod method, String endPoint,
      {Map<String, dynamic>? params}) async {
    late String url;

    url = endPoint;

    final options = await _getOptions();
    return await _invoke(url, method, params: params, options: options);
  }

  _invoke(String url, HttpMethod method,
      {Options? options, Map<String, dynamic>? params, dynamic data}) async {
    try {
      switch (method) {
        case HttpMethod.get:
          return await _get(url, param: params, options: options);
        case HttpMethod.post:
          return await _post(url, param: params, data: data, options: options);

        default:
          throw InvalidHttpMethodException(method.toString());
      }
    } on DioError catch (e) {
      var statusCode = e.response!.statusCode;
      var cause = e.response!.data;

      if (statusCode == 200) {
        throw SuccessRequest(cause);
      }
      if (statusCode == 400) {
        throw BadRequestFailException(cause);
      }
      if (statusCode == 401) {
        throw AuthenticationFailException(cause);
      }
      if (statusCode == 404) {
        throw NotFoundException(cause);
      }
      if (statusCode == 422) {
        throw UnprocessableException(cause);
      }
      if (statusCode == 500) {
        InternalFailException(cause);
      }
      var result = {'message': '[$statusCode] $cause'};
      if (cause is Map) {
        result = cause as Map<String, String>;
      }

      throw HttpErrorException(result);
    }
  }

  Future<dynamic> _post(String url,
      {Map<String, dynamic>? param, dynamic data, Options? options}) async {
    late Response response;

    response = await _dio.post(url,
        queryParameters: param, data: data, options: options);

    return response.data;
  }

  Future _get(
    String url, {
    Map<String, dynamic>? param,
    Options? options,
  }) async {
    late Response response;
    response = await _dio.get(url, queryParameters: param, options: options);
    return response.data;
  }

  Future<Options?> _getOptions() async {
    return Options();
  }
}

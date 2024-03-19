import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../share/boundaries/http_connection/http_facade.dart';
import '../share/boundaries/http_connection/http_facade_impl.dart';

class HttpConnectionInjector {
  call() {
    GetIt.I.registerFactory<Dio>(() => Dio());

    GetIt.I.registerFactory<HttpFacade>(
      () => HttpFacadeImpl(
        GetIt.I<Dio>(),
      ),
    );
  }
}

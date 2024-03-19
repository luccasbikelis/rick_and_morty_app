import 'package:rick_and_morty_app/dependency_injection/dashboard_injector.dart';
import 'package:rick_and_morty_app/dependency_injection/http_connection_injector.dart';

class Injector {
  call() {
    HttpConnectionInjector()();
    DashboardInjector()();
   
  }
}

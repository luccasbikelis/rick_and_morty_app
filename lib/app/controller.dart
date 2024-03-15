import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_app/dependency_injection/injector.dart';


class Controller with ChangeNotifier {
  Controller();

  void loadDependencyInjection() {
    Injector()();
  }

  call() async {
    loadDependencyInjection();
  }
}

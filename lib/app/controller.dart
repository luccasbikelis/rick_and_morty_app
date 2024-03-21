import 'package:flutter/widgets.dart';

class Controller with ChangeNotifier {
  Controller();

  void loadDependencyInjection() {}

  call() async {
    loadDependencyInjection();
  }
}

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/app.dart';
import 'package:rick_and_morty_app/app/controller.dart';


Future main() async {
  Controller controller = Controller();
  await controller();
  runApp(App(controller: controller));
}

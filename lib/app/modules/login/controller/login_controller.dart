import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends RxController {
  late final TextEditingController usernameTextController;
  late final TextEditingController passwordTextController;

  controllerInitializer() {
    usernameTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controllerInitializer();
  }

  login() async {}
}

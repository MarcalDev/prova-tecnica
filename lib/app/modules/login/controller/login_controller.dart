import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seventh_prova_tecnica/app/modules/video_player/page/video_player_menu_page.dart';
import 'package:seventh_prova_tecnica/base/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends RxController {
  late final TextEditingController usernameTextController;
  late final TextEditingController passwordTextController;
  late final UserService userService;
  late final SharedPreferences sharedPreferences;

  controllerInitializer() async {
    usernameTextController = TextEditingController();
    passwordTextController = TextEditingController();
    userService = UserService();
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await controllerInitializer();
  }

  login() async {
    try {
      var token = await userService.login(
          usernameTextController.text, passwordTextController.text);
      sharedPreferences.setString('token', token);
      sharedPreferences.setString('username', usernameTextController.text);
      sharedPreferences.setString('password', passwordTextController.text);
      Get.to(() => VideoPlayerMenuPage());
    } catch (e) {
      print(e);
    }
  }
}

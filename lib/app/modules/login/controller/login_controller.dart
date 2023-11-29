import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seventh_prova_tecnica/app/modules/video_player/page/video_player_page.dart';
import 'package:seventh_prova_tecnica/base/services/user_service.dart';

class LoginController extends RxController {
  late final TextEditingController usernameTextController;
  late final TextEditingController passwordTextController;
  late final UserService userService;

  controllerInitializer() {
    usernameTextController = TextEditingController();
    passwordTextController = TextEditingController();
    userService = UserService();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controllerInitializer();
  }

  login() async {
    try {
      var token = await userService.login(
          usernameTextController.text, passwordTextController.text);
      print(token);
      Get.to(() => VideoPlayerPage(token: token));
    } catch (e) {
      print(e);
    }
  }
}

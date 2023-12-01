import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seventh_prova_tecnica/app/modules/video_player/page/video_player_menu_page.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/error_popup_widget.dart';
import 'package:seventh_prova_tecnica/base/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends RxController {
  late final TextEditingController usernameTextController;
  late final TextEditingController passwordTextController;
  late final UserService userService;
  late final SharedPreferences sharedPreferences;
  late final RxBool _isLoading;

  controllerInitializer() async {
    usernameTextController = TextEditingController();
    passwordTextController = TextEditingController();
    _isLoading = false.obs;
    userService = UserService();
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await controllerInitializer();
  }

  bool get isLoading => _isLoading.value;

  login(BuildContext context) async {
    try {
      _isLoading.value = true;
      if (usernameTextController.text.isEmpty ||
          passwordTextController.text.isEmpty)
        // throw ErrorLoginException("Verifique os campos não preenchidos");
        return ErrorPopup.openPopup(
            context, "Verifique os campos não preenchidos");
      var token = await userService.login(usernameTextController.text.trim(),
          passwordTextController.text.trim());
      sharedPreferences.setString('token', token);
      sharedPreferences.setString('username', usernameTextController.text);
      sharedPreferences.setString('password', passwordTextController.text);
      Get.offAll(() => VideoPlayerMenuPage());
    } catch (e) {
      ErrorPopup.openPopup(context, "Username ou senha incorreto(s)");
    } finally {
      _isLoading.value = false;
    }
  }
}

class ErrorLoginException implements Exception {
  String errorMessage;
  ErrorLoginException(this.errorMessage);
}

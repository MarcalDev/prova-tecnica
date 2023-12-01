import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seventh_prova_tecnica/app/modules/video_player/page/video_player_menu_page.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/error_popup_widget.dart';
import 'package:seventh_prova_tecnica/app/util/custom_exception.dart';
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
    super.onInit();
    await controllerInitializer();
  }

  bool get isLoading => _isLoading.value;

  login(BuildContext context) async {
    try {
      _isLoading.value = true;
      if (usernameTextController.text.isEmpty ||
          passwordTextController.text.isEmpty) {
        {
          throw const ErrorLoginException(
              "Verifique os campos não preenchidos");
        }
      }
      await InternetAddress.lookup('www.google.com');
      var token = await userService.login(usernameTextController.text.trim(),
          passwordTextController.text.trim());
      if (token == null) {
        throw const ErrorLoginException(
            "Nome do usuário ou senha incorreto(s)");
      }
      sharedPreferences.setString('token', token);
      sharedPreferences.setString('username', usernameTextController.text);
      sharedPreferences.setString('password', passwordTextController.text);
      Get.offAll(() => const VideoPlayerMenuPage());
    } on CustomException catch (e) {
      ErrorPopup.openPopup(context, e.message);
    } on SocketException {
      ErrorPopup.openPopup(context, "Não foi possível se conectar à internet");
    } catch (e) {
      ErrorPopup.openPopup(context, "Nome do usuário ou senha incorreto(s)");
    } finally {
      _isLoading.value = false;
    }
  }
}

class ErrorLoginException implements CustomException {
  final String? errorMessage;
  const ErrorLoginException(this.errorMessage) : super();
  @override
  String? get message => errorMessage;
}

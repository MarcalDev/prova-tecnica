import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seventh_prova_tecnica/app/modules/login/controller/login_controller.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/background_widget.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/button_widget.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(children: [
        TextFieldWidget(
          textEditingController: controller.usernameTextController,
          hintText: 'Username',
        ),
        TextFieldWidget(
          textEditingController: controller.passwordTextController,
          hintText: 'Password',
        ),
        ButtonWidget(
          buttonText: 'LOGIN',
          onPressed: controller.login,
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seventh_prova_tecnica/app/modules/login/controller/login_controller.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/background_widget.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/button_widget.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/text_field_widget.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/text_widget.dart';
import 'package:seventh_prova_tecnica/app/util/app_colors.dart';
import 'package:seventh_prova_tecnica/app/util/text_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: AppColors.backgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    text: 'Prova Técnica Seventh',
                    fontSize: TextFonts.pageTitleFont,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    text: 'Faça o login para acessar o vídeo',
                    fontSize: TextFonts.loginSubtitleFont,
                    textColor: AppColors.darkGrayColor,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFieldWidget(
                          // labelText: 'Usuário',
                          textEditingController:
                              controller.usernameTextController,
                          hintText: 'Digite o usuário',
                          prefixIcon:
                              const Icon(Icons.person, color: Colors.blue),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextFieldWidget(
                          // labelText: 'Senha',
                          textEditingController:
                              controller.passwordTextController,
                          hintText: 'Digite a senha',
                          isPassword: true,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(
                  () => ButtonWidget(
                    width: 100.w,
                    height: 5.5.h,
                    buttonColor: Colors.blue,
                    textColor: Colors.white,
                    isLoading: controller.isLoading,
                    buttonText: 'ENTRAR',
                    onPressed: () async => controller.login(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

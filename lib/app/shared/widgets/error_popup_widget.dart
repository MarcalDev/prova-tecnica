import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/button_widget.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/text_widget.dart';
import 'package:seventh_prova_tecnica/app/util/app_colors.dart';
import 'package:seventh_prova_tecnica/app/util/text_fonts.dart';

class ErrorPopup {
  static void openPopup(BuildContext context, String errorText) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ErrorPopupWidget(
            popupText: errorText,
          );
        });
  }
}

class ErrorPopupWidget extends StatefulWidget {
  const ErrorPopupWidget({super.key, required this.popupText});
  final String popupText;

  @override
  State<ErrorPopupWidget> createState() => _ErrorPopupWidgetState();
}

class _ErrorPopupWidgetState extends State<ErrorPopupWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 2.h,
          ),
          TextWidget(
            fontSize: TextFonts.bigTextFont,
            text: widget.popupText,
          ),
          SizedBox(
            height: 4.h,
          ),
          ButtonWidget(
            width: 100.w,
            buttonColor: Colors.blue,
            buttonText: 'OK',
            textColor: AppColors.whiteColor,
            onPressed: () => Get.back(),
          ),
          SizedBox(
            height: 2.h,
          )
        ]),
      ),
    );
  }
}

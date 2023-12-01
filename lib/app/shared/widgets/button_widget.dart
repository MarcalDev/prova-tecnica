import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/text_widget.dart';
import 'package:seventh_prova_tecnica/app/util/text_fonts.dart';

class ButtonWidget extends StatefulWidget {
  final String? buttonText;
  final Color? buttonColor;
  final void Function()? onPressed;
  final Color? textColor;
  final double? height;
  final double? width;
  final Widget? child;
  final bool isLoading;
  const ButtonWidget(
      {super.key,
      this.buttonText,
      this.buttonColor,
      this.onPressed,
      this.textColor,
      this.width,
      this.height,
      this.child,
      this.isLoading = false});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color?>(widget.buttonColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
          onPressed: widget.onPressed,
          child: widget.child ??
              (widget.isLoading
                  ? SizedBox(
                      height: 3.h,
                      width: 3.h,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ))
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: TextWidget(
                          fontSize: TextFonts.buttonFont,
                          text: widget.buttonText ?? '',
                          textColor: widget.textColor),
                    ))),
    );
  }
}

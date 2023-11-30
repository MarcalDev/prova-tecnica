import 'package:flutter/material.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/text_widget.dart';

class ButtonWidget extends StatefulWidget {
  final String? buttonText;
  final Color? buttonColor;
  final void Function()? onPressed;
  final Color? textColor;
  final double? height;
  final double? width;
  final Widget? child;
  const ButtonWidget(
      {super.key,
      this.buttonText,
      this.buttonColor,
      this.onPressed,
      this.textColor,
      this.width,
      this.height,
      this.child});

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
              TextWidget(
                  text: widget.buttonText ?? '', textColor: widget.textColor)),
    );
  }
}

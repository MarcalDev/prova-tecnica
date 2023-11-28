import 'package:flutter/material.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/text_widget.dart';

class ButtonWidget extends StatefulWidget {
  final String buttonText;
  final Color? buttonColor;
  final void Function()? onPressed;
  final Color? textColor;
  const ButtonWidget(
      {super.key,
      required this.buttonText,
      this.buttonColor,
      this.onPressed,
      this.textColor});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPressed,
        child:
            TextWidget(text: widget.buttonText, textColor: widget.textColor));
  }
}

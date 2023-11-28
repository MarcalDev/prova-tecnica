import 'package:flutter/material.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/text_widget.dart';
import 'package:seventh_prova_tecnica/app/util/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final bool isPassword;
  final Color? borderColor;
  final Icon? suffixIcon;
  final TextEditingController textEditingController;
  final double? width;
  const TextFieldWidget(
      {super.key,
      required this.hintText,
      this.labelText,
      this.isPassword = false,
      this.borderColor,
      this.suffixIcon,
      required this.textEditingController,
      this.width});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.labelText != null) TextWidget(text: widget.labelText!),
        SizedBox(
          width: widget.width,
          child: TextField(
            controller: widget.textEditingController,
            textAlignVertical: TextAlignVertical.center,
            obscureText: widget.isPassword,
            maxLines: 1,
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              hintText: widget.hintText,
              fillColor: Colors.white,
              labelStyle: const TextStyle(
                  color: AppColors.blackColor,
                  backgroundColor: Colors.transparent),
              filled: true,
            ),
          ),
        )
      ],
    );
  }
}

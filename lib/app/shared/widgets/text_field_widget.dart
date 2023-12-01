import 'package:flutter/material.dart';
import 'package:seventh_prova_tecnica/app/shared/widgets/text_widget.dart';
import 'package:seventh_prova_tecnica/app/util/app_colors.dart';
import 'package:seventh_prova_tecnica/app/util/text_fonts.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final bool isPassword;
  final Color? borderColor;
  final Icon? suffixIcon;
  final TextEditingController textEditingController;
  final double? width;
  final Widget? prefixIcon;
  const TextFieldWidget(
      {super.key,
      required this.hintText,
      this.labelText,
      this.isPassword = false,
      this.borderColor,
      this.suffixIcon,
      required this.textEditingController,
      this.width,
      this.prefixIcon});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          TextWidget(text: widget.labelText!, textAlign: TextAlign.left),
        SizedBox(
          width: widget.width,
          child: TextField(
            controller: widget.textEditingController,
            textAlignVertical: TextAlignVertical.center,
            obscureText: widget.isPassword ? _showPassword : false,
            maxLines: 1,
            decoration: InputDecoration(
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(
                        (_showPassword)
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                      ))
                  : const SizedBox(),
              prefixIcon: widget.prefixIcon,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              hintText: widget.hintText,
              hintStyle: TextStyle(fontWeight: FontWeight.normal),
              fillColor: AppColors.textFieldBackground,
              labelStyle: TextStyle(
                  fontSize: TextFonts.textFieldFont,
                  color: AppColors.blackColor,
                  backgroundColor: Colors.transparent),
              isDense: false,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color:
                          widget.borderColor ?? AppColors.textFieldBackground,
                      width: 0.5)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(
                      color:
                          widget.borderColor ?? AppColors.textFieldBackground)),
            ),
          ),
        )
      ],
    );
  }
}

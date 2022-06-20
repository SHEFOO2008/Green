import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?) validation;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Key? fieldKey;
  final TextInputType? type;
  final String? hint;
  final String? label;
  final InputBorder? inputBorder;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final Color? fillColor;
  final bool? filled;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final BorderSide focusBorderSide;
  final BorderSide borderSide;
  final BorderRadius focusBorderRadius;
  final BorderRadius borderRadius;
  final String? labelFontFamily;
  final FontWeight? labelFontWeight;
  final double? labelFontSize;
  final Color? labelColor;
  final bool obsecureText;
  final Function()? onSuffixPressed;
  final FocusNode? focusNode;

  const TextFormFieldWidget({
    this.controller,
    required this.validation,
    this.fontWeight,
    this.fontSize,
    this.fieldKey,
    this.type,
    this.hint,
    this.label,
    this.inputBorder,
    this.prefixIcon,
    this.suffixIcon,
    this.filled,
    this.fillColor,
    this.onChanged,
    this.onSubmit,
    required this.focusBorderSide,
    required this.focusBorderRadius,
    required this.borderSide,
    required this.borderRadius,
    this.labelFontFamily,
    this.labelFontWeight,
    this.labelFontSize,
    this.labelColor,
    required this.obsecureText,
    this.onSuffixPressed,
    this.focusNode,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      key: fieldKey,
      validator: validation,
      keyboardType: type,
      textDirection: TextDirection.ltr,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.ltr,
        border: OutlineInputBorder(
          borderSide: borderSide,
          borderRadius: borderRadius,
        ),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyText2,
        labelText: label,
        labelStyle: TextStyle(
            fontFamily: labelFontFamily,
            fontSize: labelFontSize,
            color: labelColor,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          onPressed: onSuffixPressed,
          icon: Icon(suffixIcon),
        ),
        filled: filled,
        fillColor: fillColor,
        focusedBorder: OutlineInputBorder(
          borderSide: focusBorderSide,
          borderRadius: focusBorderRadius,
        ),
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
        fontSize: 16,
      ),
      obscureText: obsecureText,
    );
  }
}
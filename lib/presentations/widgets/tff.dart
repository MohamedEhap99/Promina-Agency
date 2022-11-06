import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Color? cursorColor;
  final TextStyle? style;
  final String? labeltext;
  final String? hinttext;
  final TextStyle? labelstyle;
  final Color? color;
  final IconData? suffixicon;
  final VoidCallback? suffixpressed;
  final Color? fillcolor;
  final bool? filled;
  final TextEditingController? controller;
  final TextInputType? keyboardtype;
  final bool obscuretext;
  final ValueChanged<String>? onSubmit;
  final FormFieldSetter<String>? onSaved;
  final GestureTapCallback? ontap;
  final FormFieldValidator<String>? validate;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius borderradius;
  final BorderSide borderside;
  final InputBorder? border;
  const CustomTextFormField({
    super.key,
    this.cursorColor,
    this.style,
    this.labeltext,
    this.hinttext,
    this.labelstyle,
    this.color,
    this.suffixicon,
    this.suffixpressed,
    this.fillcolor,
    this.filled,
    this.controller,
    this.keyboardtype,
    this.obscuretext = false,
    this.onSubmit,
    this.onSaved,
    this.ontap,
    this.validate,
    this.contentPadding,
    this.borderradius = BorderRadius.zero,
    this.borderside = BorderSide.none,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cursorColor,
      style: style,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding,
        border: border,
        focusedBorder: UnderlineInputBorder(
          borderRadius: borderradius,
          borderSide: borderside,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderradius,
          borderSide: borderside,
        ),
        labelText: labeltext,
        hintText: hinttext,
        labelStyle: labelstyle,
        suffixIcon: suffixicon != null
            ? IconButton(onPressed: suffixpressed, icon: Icon(suffixicon))
            : null,
        fillColor: fillcolor,
        filled: filled,
      ),
      controller: controller,
      keyboardType: keyboardtype,
      obscureText: obscuretext,
      onFieldSubmitted: onSubmit,
      onSaved: onSaved,
      onTap: ontap,
      validator: validate,
    );
  }
}

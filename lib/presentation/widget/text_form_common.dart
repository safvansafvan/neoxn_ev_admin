import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';

// ignore: must_be_immutable
class TextFormFieldCommon extends StatelessWidget {
  TextFormFieldCommon(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyType,
      required this.size,
      this.prefixIcon,
      this.maxlength,
      this.suffixIcon});

  final String hintText;
  final Size size;
  final TextInputType keyType;
  final dynamic prefixIcon;
  final dynamic suffixIcon;
  final dynamic maxlength;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: radiusTen,
        borderSide: const BorderSide(color: Colors.blue));
    return TextFormField(
      controller: controller,
      maxLength: maxlength,
      keyboardType: keyType,
      validator: (value) {
        if (value!.isEmpty) {
          return "Required";
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIconColor: kblack,
          prefixIcon: prefixIcon,
          suffixIconColor: kblack,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(color: kblack),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          disabledBorder: border),
      style: TextStyle(
        fontSize: size.width * 0.045,
        color: kblack,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

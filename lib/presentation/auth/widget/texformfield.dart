import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';

class TextFormLogin extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyType;
  final bool isPassword;
  final bool isEmail;
  final Size size;
  final dynamic prefixIcon;
  final dynamic maxlength;
  const TextFormLogin(
      {super.key,
      required this.prefixIcon,
      required this.controller,
      required this.hintText,
      required this.keyType,
      required this.size,
      this.isPassword = false,
      this.isEmail = false,
      this.maxlength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxlength,
      controller: controller,
      keyboardType: keyType,
      validator: (value) {
        if (isPassword) {
          if (value == null || value.isEmpty) {
            return "Password is required";
          }
        }

        if (isEmail) {
          if (value != null && !EmailValidator.validate(value)) {
            return "Enter valid email";
          }
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIconColor: kblack,
        prefixIcon: prefixIcon,
        suffixIconColor: kblack,
        counterStyle: TextStyle(color: kblack),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(
        fontSize: size.width * 0.045,
        color: kblack,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

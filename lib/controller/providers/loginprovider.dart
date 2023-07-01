import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/apiservice/service.dart';
import 'package:nexon_ev_admin/controller/apiservice/status.dart';
import 'package:nexon_ev_admin/controller/const/string.dart';
import 'package:nexon_ev_admin/model/login_model.dart';
import 'package:nexon_ev_admin/presentation/home.dart';

class LoginProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final globelKey = GlobalKey<FormState>();

  Future<void> getLoginStatus(context) async {
    final String url = Urls.baseUrl + Urls.admin;
    var response = ApiServices.postMethod(
      url: url,
      context: context,
      data: bodyData(),
    );
    if (response is Success) {
      log("success$response");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false);
    }
  }

  Map<String, dynamic> bodyData() {
    final body = LoginModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    return body.toJson();
  }
}

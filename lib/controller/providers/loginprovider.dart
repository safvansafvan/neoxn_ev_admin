import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nexon_ev_admin/apiservice/login_service.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/model/login_model.dart';
import 'package:nexon_ev_admin/presentation/auth/login.dart';
import 'package:nexon_ev_admin/presentation/widget/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final globelKey = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> loginButtonClick(context) async {
    await LoginService.getLoginStatus(context);
    notifyListeners();
  }

  Map<String, dynamic> bodyData() {
    var body = LoginModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    return body.toJson();
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
  }

  ///navigate home or login

  SharedPreferences? preferences;
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  bool isLoggedIn() {
    final token = preferences?.getString("token");
    if (token == null) {
      return false;
    }
    if (JwtDecoder.isExpired(token)) {
      return false;
    }
    return true;
  }

  Future<void> logout(context) async {
    final pref = await SharedPreferences.getInstance();
    pref.remove("token");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );

    snakBarWiget(context: context, title: " Logout Is Success", clr: kgreen);
  }
}

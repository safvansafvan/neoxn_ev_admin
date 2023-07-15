import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/const/string.dart';
import 'package:nexon_ev_admin/model/login_model.dart';
import 'package:nexon_ev_admin/presentation/auth/login.dart';
import 'package:nexon_ev_admin/presentation/home.dart';
import 'package:nexon_ev_admin/presentation/widget/snack_bar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final globelKey = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> loginButtonClick(context) async {
    await getLoginStatus(context);
    notifyListeners();
  }

  Future<void> getLoginStatus(context) async {
    final sharedPrefrens = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();
    final String url = Urls.baseUrl + Urls.admin;
    var response = await http.post(Uri.parse(url), body: bodyData());
    if (response.statusCode == 200 || response.statusCode == 201) {
      log("${response.statusCode}");
      final data = jsonDecode(response.body);
      try {
        if (data['status'] == 'success') {
          log(response.body);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
          snakBarWiget(context: context, title: "Login Success", clr: kgreen);
          final token = data['token'];
          await sharedPrefrens.setString("token", token);
          clearController();
        } else {
          log("failed", name: "else");
          final msg = data['message'];
          snakBarWiget(context: context, title: msg, clr: kred);
        }
      } catch (e) {
        log(e.toString());
        snakBarWiget(context: context, title: e.toString(), clr: kred);
      }
      isLoading = false;
    }
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
    return token != null;
  }

  logout(context) async {
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

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/providers/loginprovider.dart';
import 'package:nexon_ev_admin/presentation/home.dart';
import 'package:nexon_ev_admin/controller/const/string.dart';
import 'package:http/http.dart' as http;
import 'package:nexon_ev_admin/presentation/widget/snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static Future<void> getLoginStatus(context) async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final sharedPrefrens = await SharedPreferences.getInstance();

    final String url = Urls.baseUrl + Urls.admin;
    var response =
        await http.post(Uri.parse(url), body: loginProvider.bodyData());
    if (response.statusCode == 200 || response.statusCode == 201) {
      log("${response.statusCode}");
      final data = jsonDecode(response.body);
      try {
        if (data['status'] == 'success') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
          snakBarWiget(context: context, title: "Login Success", clr: kgreen);
          final token = data['token'];
          await sharedPrefrens.setString("token", token);
          loginProvider.clearController();
        } else {
          log("failed", name: "else");
          final msg = data['message'];
          snakBarWiget(context: context, title: msg, clr: kred);
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }
}

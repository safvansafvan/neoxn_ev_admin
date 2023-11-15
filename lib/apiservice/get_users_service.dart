import 'dart:convert';
import 'dart:developer';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/const/string.dart';
import 'package:nexon_ev_admin/presentation/widget/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String? token;

class UserService {
  static Future getUserStatus(context) async {
    final pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    final String url = Urls.baseUrl + Urls.admin + Urls.getUsers;
    try {
      final response = await http
          .get(Uri.parse(url), headers: {'x-access-admintoken': token!});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final status = data['status'];
        if (status == 'success') {
          final result = data['result'];
          return result;
        } else {
          log(status);
          snakBarWiget(context: context, title: status, clr: kred);
        }
      } else {
        final data = jsonDecode(response.body);
        final msg = data['message'];
        snakBarWiget(context: context, title: msg, clr: kred);
      }
    } catch (e) {
      log(e.toString());
      snakBarWiget(context: context, title: e.toString(), clr: kred);
    }
  }

  static Future userBlockOrUnblock(userId, context) async {
    final url = Urls.baseUrl + Urls.admin + Urls.blockUser;
    try {
      final response = await http.post(Uri.parse(url),
          body: {"id": userId}, headers: {'x-access-admintoken': token!});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          log(response.body.toString());
        } else {
          log(data['status']);
          snakBarWiget(context: context, title: data['status'], clr: kred);
        }
      } else {
        snakBarWiget(context: context, title: "Network Error", clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

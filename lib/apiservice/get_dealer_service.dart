import 'dart:convert';
import 'dart:developer';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/const/string.dart';
import 'package:nexon_ev_admin/presentation/widget/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future getDealersStatus(context) async {
  final pref = await SharedPreferences.getInstance();
  final token = pref.getString("token");
  final String url = Urls.baseUrl + Urls.admin + Urls.getDealers;
  try {
    final response = await http
        .get(Uri.parse(url), headers: {'x-access-admintoken': token!});
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final status = data['status'];
      if (status == 'success') {
        log("${response.statusCode}");
        log("$data", name: "get dealer");
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

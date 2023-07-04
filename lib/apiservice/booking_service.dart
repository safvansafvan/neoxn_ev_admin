import 'dart:convert';
import 'dart:developer';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/const/string.dart';
import 'package:http/http.dart' as http;
import 'package:nexon_ev_admin/presentation/widget/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future getBookingStatus(context) async {
  final String url = Urls.baseUrl + Urls.admin + Urls.getBookings;
  final pref = await SharedPreferences.getInstance();
  final token = pref.getString("token");
  log("$token");
  try {
    final response = await http
        .get(Uri.parse(url), headers: {'x-access-admintoken': token!});
    log("called get function in booked person");
    if (response.statusCode == 200) {
      log(response.body);
      final data = jsonDecode(response.body);
      final result = data['result'];
      return result;
    } else {
      log("else worked$response");
      log("${response.statusCode}");
      snakBarWiget(context: context, title: "Data fetching failed", clr: kred);
    }
  } catch (e) {
    log(e.toString(), name: "catch");
    snakBarWiget(context: context, title: e.toString(), clr: kred);
  }
}
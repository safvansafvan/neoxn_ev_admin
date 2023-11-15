import 'dart:convert';
import 'dart:developer';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/const/string.dart';
import 'package:http/http.dart' as http;
import 'package:nexon_ev_admin/presentation/widget/snack_bar.dart';

Future getTestDriveBookingStatus(context) async {
  final String url = Urls.baseUrl + Urls.admin + Urls.getTestDrive;
  try {
    final response = await http.get(Uri.parse(url));
    log("called get function");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final result = data['result'];
      return result;
    } else if (response.statusCode == 503) {
      log("Service temporarily unavailable");
      snakBarWiget(
          context: context,
          title: "Service temporarily unavailable",
          clr: kred);
    } else {
      log("Data fetching failed: ${response.statusCode}");
      snakBarWiget(context: context, title: "Data fetching failed", clr: kred);
    }
  } catch (e) {
    log(e.toString(), name: "catch");
  }
}

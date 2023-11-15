import 'dart:convert';
import 'dart:developer';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/const/string.dart';
import 'package:http/http.dart' as http;
import 'package:nexon_ev_admin/controller/providers/test_dbooked_provider.dart';
import 'package:nexon_ev_admin/model/test_drive_model.dart';
import 'package:nexon_ev_admin/presentation/widget/snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestDriveService {
  static String? token = "";
  static Future getTestDriveBookingStatus(context) async {
    final String url = Urls.baseUrl + Urls.admin + Urls.getTestDrive;
    final pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    try {
      final response = await http.get(Uri.parse(url));
      log("called get function");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<TestDriveStatus> testDrive = (data['result'] as List)
            .map((e) => TestDriveStatus.fromJson(e))
            .toList();
        return testDrive;
      } else if (response.statusCode == 503) {
        log("Service temporarily unavailable");
        snakBarWiget(
            context: context,
            title: "Service temporarily unavailable",
            clr: kred);
      } else {
        log("Data fetching failed: ${response.statusCode}");
        snakBarWiget(
            context: context, title: "Data fetching failed", clr: kred);
      }
    } catch (e) {
      log(e.toString(), name: "catch");
    }
  }

  static Future updateStatus({context, id}) async {
    final provider = Provider.of<TestDriveProvider>(context, listen: false);
    final String url = Urls.baseUrl + Urls.admin + Urls.updateStatus;
    final body = {'status': provider.statusController.text, 'id': id};
    try {
      final response = await http.post(Uri.parse(url),
          body: body, headers: {'x-access-admintoken': token!});
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['status'] == 'success') {
          log('updated');
        }
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

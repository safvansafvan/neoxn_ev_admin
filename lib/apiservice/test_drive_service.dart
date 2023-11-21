import 'dart:convert';
import 'dart:developer';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/const/functions.dart';
import 'package:nexon_ev_admin/controller/const/string.dart';
import 'package:http/http.dart' as http;
import 'package:nexon_ev_admin/controller/providers/test_dbooked_provider.dart';
import 'package:nexon_ev_admin/model/test_drive_model.dart';
import 'package:nexon_ev_admin/presentation/widget/snack_bar.dart';
import 'package:provider/provider.dart';

class TestDriveService {
  static String? token = "";
  static Future getTestDriveBookingStatus(context) async {
    final String url = Urls.baseUrl + Urls.admin + Urls.getTestDrive;
    token = await getAdminToken();
    try {
      final response = await http.get(Uri.parse(url));
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
    final String url = Urls.baseUrl + Urls.admin + Urls.updateTestDrive;
    final body = {
      'status': Provider.of<TestDriveProvider>(context, listen: false)
          .statusController
          .text,
      'id': id
    };

    try {
      final response = await http.post(Uri.parse(url),
          body: body, headers: {'x-access-admintoken': token!});
      final data = jsonDecode(response.body);
      log(data);
      if (response.statusCode == 200) {
        if (data['status'] == 'success') {
          await getTestDriveBookingStatus(context);
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

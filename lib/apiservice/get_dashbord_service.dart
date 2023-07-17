import 'dart:convert';
import 'package:nexon_ev_admin/controller/const/string.dart';
import 'package:nexon_ev_admin/model/dashbord_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DashbordService {
  static String? token;

  Future<DashboardData> fetchDashboardData() async {
    final String url = Urls.baseUrl + Urls.admin + Urls.getDashbord;
    final pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    final response = await http
        .get(Uri.parse(url), headers: {'x-access-admintoken': token!});
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return DashboardData.fromJson(data);
    } else {
      throw Exception('Failed to load dashboard data');
    }
  }
}

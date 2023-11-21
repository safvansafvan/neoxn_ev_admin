import 'package:shared_preferences/shared_preferences.dart';

getAdminToken() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getString("token");
}

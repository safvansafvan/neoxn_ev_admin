import 'dart:convert';
import 'dart:developer';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/const/string.dart';
import 'package:http/http.dart' as http;
import 'package:nexon_ev_admin/controller/providers/booked_provider.dart';
import 'package:nexon_ev_admin/model/booking_status.dart';
import 'package:nexon_ev_admin/presentation/widget/snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingService {
  static String? token = "";
  static Future getBookingStatus(context) async {
    final String url = Urls.baseUrl + Urls.admin + Urls.getBookings;
    final pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    log(token.toString(), name: 'access token');
    try {
      final response = await http
          .get(Uri.parse(url), headers: {'x-access-admintoken': token!});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<BookingStatus> bookingStatus = (data['result'] as List)
            .map((e) => BookingStatus.fromJson(e))
            .toList();
        return bookingStatus;
      } else {
        log("else worked$response");
        log("${response.statusCode}");
        snakBarWiget(
            context: context, title: "Data fetching failed", clr: kred);
      }
    } catch (e) {
      log(e.toString(), name: "catch");
    }
  }

  static Future updateStatus({context, id}) async {
    final provider = Provider.of<BookingProvider>(context, listen: false);
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

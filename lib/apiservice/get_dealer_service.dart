import 'dart:convert';
import 'dart:developer';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/const/functions.dart';
import 'package:nexon_ev_admin/controller/const/string.dart';
import 'package:nexon_ev_admin/model/add_delaer_model.dart';
import 'package:nexon_ev_admin/presentation/widget/snack_bar.dart';
import 'package:http/http.dart' as http;

class DealerService {
  static String? token;
  static Future getDealersStatus(context) async {
    token = await getAdminToken();
    final String url = Urls.baseUrl + Urls.admin + Urls.getDealers;
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
    }
  }

  static Future deleteDeaelerStatus(dealerId, context) async {
    final String url = Urls.baseUrl + Urls.admin + Urls.deleteDealer;
    try {
      final response = await http.post(Uri.parse(url),
          body: {'id': dealerId}, headers: {'x-access-admintoken': token!});
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        log("success");
        if (data['status'] == 'success') {
          log("dealerDeleted Success");
        } else {
          log("deleted failed");
          snakBarWiget(context: context, title: "Failed Delete", clr: kred);
        }
      } else {
        log(response.statusCode.toString());
        snakBarWiget(context: context, title: "Network Error", clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future blockDealerStatus(dealerId, context) async {
    final String url = Urls.baseUrl + Urls.admin + Urls.blockDealer;
    try {
      final response = await http.post(Uri.parse(url),
          body: {'id': dealerId}, headers: {'x-access-admintoken': token!});
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        log("success");
        if (data['status'] == 'success') {
          log(" Success");
        } else {
          log(" failed");
          snakBarWiget(context: context, title: "Failed", clr: kred);
        }
      } else {
        log(response.statusCode.toString());
        snakBarWiget(context: context, title: "Network Error", clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future addDealerStatus(
      {context,
      required name,
      required phone,
      required city,
      required state,
      required email,
      required password}) async {
    final String url = Urls.baseUrl + Urls.admin + Urls.addDealer;
    try {
      final response = await http.post(Uri.parse(url),
          body: dlrBody(
              name: name,
              phone: phone,
              city: city,
              state: state,
              email: email,
              password: password),
          headers: {'x-access-admintoken': token!});
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (data['status'] == 'success') {
          log(data['status'].toString());
          snakBarWiget(context: context, title: "$name added", clr: kgreen);
        } else {
          log(data['message'].toString());
          snakBarWiget(
              context: context, title: data['message'].toString(), clr: kred);
        }
      } else {
        snakBarWiget(context: context, title: "Network Error", clr: kred);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Map<String, dynamic> dlrBody(
      {required name,
      required phone,
      required city,
      required state,
      required email,
      required password}) {
    final data = AddDealerReq(
        dealerName: name,
        phone: phone,
        city: city,
        state: state,
        email: email,
        password: password);
    return data.toJson();
  }
}

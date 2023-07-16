import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/const/string.dart';
import 'package:nexon_ev_admin/model/add_delaer_model.dart';
import 'package:nexon_ev_admin/presentation/widget/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DealerService {
  static String? token;
  static Future getDealersStatus(context) async {
    final pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
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

  addDealer(
      {context,
      required TextEditingController name,
      required TextEditingController phone,
      required TextEditingController city,
      required TextEditingController state}) async {
    final String url = Urls.baseUrl + Urls.admin + Urls.addDealer;
    try {
      final response = await http.post(Uri.parse(url),
          body: dlrBody(name: name, phone: phone, city: city, state: state),
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

  Map<String, dynamic> dlrBody(
      {required TextEditingController name,
      required TextEditingController phone,
      required TextEditingController city,
      required TextEditingController state}) {
    final data = AddDealerReq(
        name: name.text.trim(),
        phone: phone.text.trim(),
        city: city.text.trim(),
        state: state.text.trim());
    return data.toJson();
  }
}

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:nexon_ev_admin/controller/apiservice/status.dart';

class ApiServices {
  // POST METHOD
  static Future<Object> postMethod({
    required String url,
    required BuildContext context,
    Function? function,
    Map<String, String>? headers,
    required Map<String, dynamic> data,
  }) async {
    log(data.toString(), name: "send");
    try {
      final response =
          await http.post(Uri.parse(url), body: data, headers: headers);
      log("+++++++++++${response.statusCode}++++++++++");
      log("apiService${response.body.toString()}");
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Success(
            response: function == null ? null : function(response.body));
      }
      return Failures(
          code: response.statusCode, errrorResponse: "Invalid Response");
    } on HttpException {
      return Failures(code: 101, errrorResponse: "No Internet");
    } on FormatException {
      return Failures(code: 102, errrorResponse: "Invalid Format");
    } on SocketException catch (e) {
      log(e.toString());
      return Failures(code: 101, errrorResponse: "No Internet");
    } on TimeoutException {
      return Failures(code: 104, errrorResponse: "Time Out");
    } catch (e) {
      log(e.toString());
      return Failures(code: 500, errrorResponse: "Unknown error");
    }
  }
}

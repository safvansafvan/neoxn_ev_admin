import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/apiservice/get_users_service.dart';

class UsersProvider extends ChangeNotifier {
  bool isLoading = false;
  List<dynamic> userList = [];
  Future fetchUsers(context) async {
    isLoading = true;
    userList = await getUserStatus(context);
    isLoading = false;
    notifyListeners();
  }
}

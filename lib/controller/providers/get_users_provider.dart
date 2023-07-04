import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/apiservice/get_dealers_service.dart';

class UsersProvider extends ChangeNotifier {
  bool isLoading = false;
  List<dynamic> dealerList = [];
  Future fetchUsers(context) async {
    isLoading = true;
    dealerList = await getUserStatus(context);
    isLoading = false;
    notifyListeners();
  }
}

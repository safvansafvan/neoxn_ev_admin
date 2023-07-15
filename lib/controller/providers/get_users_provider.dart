import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/apiservice/get_users_service.dart';

class UsersProvider extends ChangeNotifier {
  bool isLoading = false;
  bool userBlckLoading = true;
  List<dynamic> userList = [];
  Future fetchUsers(context) async {
    isLoading = true;
    userList = await UserService.getUserStatus(context);
    isLoading = false;
    notifyListeners();
  }

  Future blockUser(userId, context) async {
    userBlckLoading = true;
    notifyListeners();
    await UserService.userBlockOrUnblock(userId, context);
    userBlckLoading = false;
    notifyListeners();
  }
}

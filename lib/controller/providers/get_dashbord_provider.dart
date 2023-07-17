import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/apiservice/get_dashbord_service.dart';
import 'package:nexon_ev_admin/model/dashbord_model.dart';

class DashbordProvider extends ChangeNotifier {
  DashboardData? _dashboardData;
  final DashbordService _dashbordService = DashbordService();

  DashboardData? get dashbordData => _dashboardData;

  bool isLoading = false;
  Future getDashbord(context) async {
    isLoading = true;
    notifyListeners();
    _dashboardData = await _dashbordService.fetchDashboardData();
    isLoading = false;
    notifyListeners();
  }
}

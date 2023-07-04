import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/apiservice/get_dealer_service.dart';

class DealerProvider extends ChangeNotifier {
  bool isLoading = false;
  List<dynamic> dealerList = [];
  Future fetchDealrs(context) async {
    isLoading = true;
    dealerList = await getDealersStatus(context);
    isLoading = false;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/apiservice/get_dealer_service.dart';

class DealerProvider extends ChangeNotifier {
  bool isLoading = false;
  List<dynamic> dealerList = [];
  bool addDlrLoading = false;
  TextEditingController dlrNameCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController cityCtr = TextEditingController();
  TextEditingController stateCtr = TextEditingController();
  Future fetchDealrs(context) async {
    isLoading = true;
    dealerList = await DealerService.getDealersStatus(context);
    isLoading = false;
    notifyListeners();
  }

  Future deleteDealer(dealerId, context) async {
    await DealerService.deleteDeaelerStatus(dealerId, context);
    notifyListeners();
  }

  Future blockDealer(dealerId, context) async {
    await DealerService.blockDealerStatus(dealerId, context);
    notifyListeners();
  }

  addDealer() {
    addDlrLoading = true;
    notifyListeners();
  }

  clearController() {
    dlrNameCtr.clear();
    phoneCtr.clear();
    cityCtr.clear();
    stateCtr.clear();
  }
}

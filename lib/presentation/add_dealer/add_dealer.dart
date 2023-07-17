import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/providers/get_dealer_provider.dart';
import 'package:nexon_ev_admin/presentation/widget/text_form_common.dart';
import 'package:provider/provider.dart';

class AddDealerScreen extends StatelessWidget {
  const AddDealerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final provider = Provider.of<DealerProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          "Add Dealer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              commonHeight,
              TextFormFieldCommon(
                  controller: provider.dlrNameCtr,
                  hintText: "Dealer name",
                  keyType: TextInputType.name,
                  size: screenSize),
              commonHeight,
              TextFormFieldCommon(
                  controller: provider.phoneCtr,
                  hintText: "Phone",
                  keyType: TextInputType.phone,
                  maxlength: 10,
                  size: screenSize),
              commonHeight,
              TextFormFieldCommon(
                  controller: provider.stateCtr,
                  hintText: "State",
                  keyType: TextInputType.name,
                  size: screenSize),
              commonHeight,
              TextFormFieldCommon(
                  controller: provider.cityCtr,
                  hintText: "City",
                  keyType: TextInputType.name,
                  size: screenSize),
              commonHeight,
              TextFormFieldCommon(
                  controller: provider.emailCtr,
                  hintText: "Email",
                  keyType: TextInputType.emailAddress,
                  size: screenSize),
              commonHeight,
              TextFormFieldCommon(
                  controller: provider.passwordCtr,
                  hintText: "Password",
                  keyType: TextInputType.name,
                  maxlength: 10,
                  size: screenSize),
              commonHeight,
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    await provider.addDealer(context);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add Dealer "),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/providers/get_dealer_provider.dart';
import 'package:nexon_ev_admin/presentation/detailshow/dealer_deatails.dart';
import 'package:provider/provider.dart';

class DealersWidget extends StatelessWidget {
  const DealersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<DealerProvider>(builder: (context, value, _) {
        return value.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  final details = value.dealerList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DealersDetailsWidget(
                              name: details['dealerName'],
                              phone: details['phone'],
                              city: details['state'],
                              state: details['city']),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Text(details['dealerName'].toString()),
                          const Spacer(),
                          Text(details['state']),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    indent: 5,
                    endIndent: 5,
                    color: Colors.grey[200],
                    thickness: 2,
                  );
                },
                itemCount: value.dealerList.length);
      }),
    );
  }
}

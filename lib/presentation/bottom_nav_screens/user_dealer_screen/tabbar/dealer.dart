import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
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
        return RefreshIndicator(
          onRefresh: () {
            return value.fetchDealrs(context);
          },
          child: value.isLoading
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
                      child: Slidable(
                        startActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) async {
                                  await value.deleteDealer(
                                      details['_id'], context);
                                },
                                backgroundColor: kwhite,
                                icon: Icons.delete_outline_rounded,
                                foregroundColor: kred,
                              ),
                              SlidableAction(
                                onPressed: (context) async {
                                  await value.blockDealer(
                                      details['_id'], context);
                                },
                                backgroundColor: kwhite,
                                icon: details['isBanned'] == true
                                    ? Icons.lock_open
                                    : Icons.lock_outline,
                              ),
                            ]),
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
                  itemCount: value.dealerList.length),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/providers/get_dashbord_provider.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DashbordProvider>(context, listen: false)
          .getDashbord(context);
    });
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            commonHeight,
            Text(
              "Admin",
              textAlign: TextAlign.center,
              style: textStyleFuc(
                  weight: FontWeight.bold, color: kblack, size: 17),
            ),
            commonHeight,
            Consumer<DashbordProvider>(
              builder: (context, value, child) {
                if (value.dashbordData == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final data = value.dashbordData!;
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: radiusTen,
                            border: Border.all(color: kblack),
                          ),
                          child: Center(
                            child: Text(
                              "Total Company Revenue: ${data.revenue.toString()}",
                              style: textStyleFuc(
                                weight: FontWeight.w500,
                                color: kblack,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        commonHeight,
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: radiusTen,
                            border: Border.all(color: kblack),
                          ),
                          child: Center(
                            child: Text(
                              "Total Bookings: ${data.totalBooking.toString()}",
                              style: textStyleFuc(
                                weight: FontWeight.w500,
                                color: kblack,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        commonHeight,
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: radiusTen,
                            border: Border.all(color: kblack),
                          ),
                          child: Center(
                            child: Text(
                              "Today Total Bookings: ${data.todayBookingCount.toString()}",
                              style: textStyleFuc(
                                weight: FontWeight.w500,
                                color: kblack,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        commonHeight,
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: radiusTen,
                            border: Border.all(color: kblack),
                          ),
                          child: Center(
                            child: Text(
                              "Test Drive Total Bookings: ${data.todayTestDriveCount.toString()}",
                              style: textStyleFuc(
                                weight: FontWeight.w500,
                                color: kblack,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

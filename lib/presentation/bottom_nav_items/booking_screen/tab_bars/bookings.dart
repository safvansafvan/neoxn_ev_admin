import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/providers/booked_provider.dart';
import 'package:nexon_ev_admin/presentation/details/booking_status.dart';
import 'package:provider/provider.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Consumer<BookingProvider>(builder: (context, value, _) {
        return value.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : FutureBuilder(
                future: value.bookingsData(context),
                builder: (context, snap) {
                  return ListView.separated(
                    itemCount: value.bookingDetailsList.length,
                    itemBuilder: (context, index) {
                      final details = value.bookingDetailsList[index];
                      return ListTile(
                        title: Text(details.names ?? 'Unknwon'),
                        subtitle: Text(details.email ?? 'Unknwon'),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookingDetailsWidget(
                                    bookingStatus: details,
                                  )),
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
                  );
                });
      }),
    );
  }
}

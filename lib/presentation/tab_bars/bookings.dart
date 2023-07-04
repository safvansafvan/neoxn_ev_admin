import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/providers/booked_provider.dart';
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
            : ListView.separated(
                itemCount: value.bookingDetailsList.length,
                itemBuilder: (context, index) {
                  final details = value.bookingDetailsList[index];
                  return InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Text(details['names'].toString()),
                          const Spacer(),
                          Text(details['email'].toString()),
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
              );
      }),
    );
  }
}

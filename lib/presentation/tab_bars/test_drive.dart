import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/providers/bookings_provider.dart';
import 'package:provider/provider.dart';

class TestDrive extends StatelessWidget {
  const TestDrive({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TestDriveProvider>(builder: (context, value, _) {
      return ListView.separated(
        itemCount: value.bookingDetails.length,
        itemBuilder: (context, index) {
          final details = value.bookingDetails[index];
          return ListTile(
            leading: Text(details['name']),
            title: Text(
              details['email'],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.blueGrey,
            thickness: 2,
          );
        },
      );
    });
  }
}

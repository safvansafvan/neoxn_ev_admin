import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/providers/bookings_provider.dart';
import 'package:nexon_ev_admin/presentation/tab_bars/details/test_drive_person.dart';
import 'package:provider/provider.dart';

class TestDrive extends StatelessWidget {
  const TestDrive({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Consumer<TestDriveProvider>(builder: (context, value, _) {
        return value.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemCount: value.bookingDetails.length,
                itemBuilder: (context, index) {
                  final details = value.bookingDetails[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TestDriveBookedPersonDetails(
                                name: details['name'],
                                email: details['email'],
                                phone: details['phone'],
                                city: details['city'],
                                state: details['state'],
                                model: details['model'],
                                dealerShip: details['dealership'])),
                      );
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Text(details['name'].toString()),
                          const Spacer(),
                          Text(details['email']),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.check))
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

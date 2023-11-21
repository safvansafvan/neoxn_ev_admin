import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/providers/test_dbooked_provider.dart';
import 'package:nexon_ev_admin/presentation/details/test_drive_status.dart';
import 'package:provider/provider.dart';

class TestDrive extends StatelessWidget {
  const TestDrive({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<TestDriveProvider>(builder: (context, value, _) {
        return value.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : FutureBuilder(
                future: value.testDriveBookingData(context),
                builder: (context, snap) {
                  return ListView.separated(
                    itemCount: value.testBookingDetails.length,
                    itemBuilder: (context, index) {
                      final details = value.testBookingDetails[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TestDriveBookedPersonDetails(
                                testDriveStatus: details,
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(details.name ?? 'Unknwon'),
                          subtitle: Text(details.email ?? 'Unknwon'),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TestDriveBookedPersonDetails(
                                testDriveStatus: details,
                              ),
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
                  );
                });
      }),
    );
  }
}

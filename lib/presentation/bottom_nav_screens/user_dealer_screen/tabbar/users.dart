import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/providers/get_users_provider.dart';
import 'package:nexon_ev_admin/presentation/detailshow/users_details.dart';
import 'package:provider/provider.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<UsersProvider>(builder: (context, value, _) {
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
                          builder: (context) => UserDetailsShowingScreen(
                            username: details['username'],
                            email: details['email'],
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Text(details['username'].toString()),
                          const Spacer(),
                          Text(details['email']),
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

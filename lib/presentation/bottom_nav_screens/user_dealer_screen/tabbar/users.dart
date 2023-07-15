import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/providers/get_users_provider.dart';
import 'package:nexon_ev_admin/presentation/detailshow/users_details.dart';
import 'package:provider/provider.dart';

class UsersWidget extends StatefulWidget {
  const UsersWidget({super.key});

  @override
  State<UsersWidget> createState() => _UsersWidgetState();
}

class _UsersWidgetState extends State<UsersWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<UsersProvider>(builder: (context, value, _) {
        return RefreshIndicator(
          onRefresh: () {
            return value.fetchUsers(context);
          },
          child: value.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final details = value.userList[index];
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
                      child: Slidable(
                        startActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) async {
                                  await value.blockUser(
                                      details['_id'], context);
                                },
                                backgroundColor: kwhite,
                                icon: details['isBanned'] == true
                                    ? Icons.lock_open
                                    : Icons.lock_outline,
                                label: details['isBanned'] == true
                                    ? "Unblock"
                                    : "Block",
                              )
                            ]),
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
                  itemCount: value.userList.length),
        );
      }),
    );
  }
}

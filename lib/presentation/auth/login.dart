import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';
import 'package:nexon_ev_admin/controller/providers/internet_provider.dart';
import 'package:nexon_ev_admin/controller/providers/loginprovider.dart';
import 'package:nexon_ev_admin/presentation/auth/widget/image.dart';
import 'package:nexon_ev_admin/presentation/auth/widget/texformfield.dart';
import 'package:nexon_ev_admin/presentation/widget/snack_bar.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final providerLogin = context.watch<LoginProvider>();
    var screenHeight = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Consumer<LoginProvider>(builder: (context, value, _) {
          return value.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                )
              : Form(
                  key: providerLogin.globelKey,
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15, top: screenHeight.height * 0.09),
                        child: Text(
                          "Admin Login!! ",
                          style: textStyleFuc(
                              weight: FontWeight.w900, color: kblack, size: 25),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight.height * 0.03,
                            left: 10,
                            right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormLogin(
                                controller: providerLogin.emailController,
                                hintText: "Email",
                                keyType: TextInputType.emailAddress,
                                isEmail: true,
                                size: screenHeight,
                                prefixIcon: const Icon(Icons.person_outline)),
                            commonHeight,
                            TextFormLogin(
                              controller: providerLogin.passwordController,
                              hintText: "Password",
                              keyType: TextInputType.name,
                              isPassword: true,
                              size: screenHeight,
                              prefixIcon: const Icon(Icons.password_rounded),
                            ),
                            SizedBox(
                              height: screenHeight.height * 0.05,
                            ),
                            const ImageWidget(image: "assets/neprime.jpeg"),
                            SizedBox(
                              height: screenHeight.height * 0.09,
                            ),
                            ElevatedButton.icon(
                              onPressed: () async {
                                if (providerLogin.globelKey.currentState!
                                    .validate()) {
                                  await handleLogin(context);
                                }
                              },
                              icon: const Icon(Icons.login_rounded),
                              label: const Text("Login"),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }

  Future<void> handleLogin(context) async {
    final providerLogin = Provider.of<LoginProvider>(context, listen: false);
    final ip = Provider.of<InternetController>(context, listen: false);
    await ip.checkConnection();
    if (ip.hasInternet == false) {
      snakBarWiget(
          context: context,
          title: 'Please Enable Internet Connection',
          clr: kgreen);
    } else {
      await providerLogin.loginButtonClick(context);
    }
  }
}

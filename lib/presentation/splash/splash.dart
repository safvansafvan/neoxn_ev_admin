// import 'package:bookingapp/controller/providers/splash.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:provider/provider.dart';
// import '../../controller/const/const.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<SplashProvider>(context, listen: false).navigateHome(context);
//     });
//     return FutureBuilder(builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return Center(
//             child: Center(
//           child: Lottie.asset("assets/ui-loader.json"),
//         ));
//       }
//       return Scaffold(
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             color: kwhite,
//             image: const DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage("assets/splash_b.webp"),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 200,
//               ),
//               Text(
//                 "Nexon Booking",
//                 style: textStyleFuc(
//                     weight: FontWeight.w900, color: kwhite, size: 28),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.only(left: 58.0, right: 58.0, top: 10),
//                 child: LinearPercentIndicator(
//                   animation: true,
//                   animationDuration: 1800,
//                   percent: 1,
//                   progressColor: const Color.fromARGB(255, 112, 21, 145),
//                   backgroundColor: const Color.fromARGB(255, 184, 89, 218),
//                   barRadius: const Radius.circular(10),
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
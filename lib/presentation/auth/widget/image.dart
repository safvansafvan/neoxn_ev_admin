import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: radiusTen,
        image: DecorationImage(
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.darken,
          ),
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
    );
  }
}

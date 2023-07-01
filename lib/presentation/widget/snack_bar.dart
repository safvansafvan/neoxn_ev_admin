import 'package:flutter/material.dart';
import 'package:nexon_ev_admin/controller/const/const.dart';

snakBarWiget(
    {required BuildContext context,
    required String title,
    required Color clr}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: 350,
      backgroundColor: clr,
      shape: RoundedRectangleBorder(
        borderRadius: radiusTen,
      ),
      behavior: SnackBarBehavior.floating,
      content: Center(
        child: Text(
          title,
          style: textStyleFuc(weight: FontWeight.w500, color: kwhite, size: 15),
        ),
      ),
    ),
  );
}

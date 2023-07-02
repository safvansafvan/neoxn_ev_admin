import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.titlevalue, required this.title});

  final String title;
  final String titlevalue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      title: Text(
        titlevalue,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

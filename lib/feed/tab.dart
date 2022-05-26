import 'package:flutter/material.dart';

class Tabb extends StatelessWidget {
  const Tabb({Key? key, required this.text}) : super(key: key);

  final EdgeInsets margin = const EdgeInsets.all(7);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      child: Padding(
        padding: margin,
        child: Center(child: Text(text)),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: Text(
        'Hello flutter',
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 50,
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rolldice/gradient_container.dart';
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 87, 8, 223),
        Color.fromARGB(255, 146, 97, 230)
        ),
      ),
    ),
  );
}


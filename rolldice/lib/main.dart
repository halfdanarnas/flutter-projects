import 'package:flutter/material.dart';

import 'package:rolldice/gradient_container.dart';
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
           Color.fromARGB(255, 2, 0, 4),
         Color.fromARGB(255, 184, 0, 28)
        ),
      ),
    ),
  );
}


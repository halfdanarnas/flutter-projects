import 'package:flutter/material.dart';
import 'package:flutter_application_1/audio_player_widget.dart';// Import your audio player widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Audio Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Audio Player Example'),
        ),
        body: Center(
          child: AudioPlayerWidget(),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
AudioPlayerWidget() {
}

import 'package:flutter/material.dart';
import 'package:lab_act/screens/musicplayer.dart';

void main() {
  runApp(MusicPlayer());
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

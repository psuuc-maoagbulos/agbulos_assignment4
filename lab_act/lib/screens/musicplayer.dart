import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _Index = 0;
  bool _isPlaying = false;

  final List<String> _playlist = [
    'assets/audio/Kiyo-ikaw_lang.mp3',
    'assets/audio/coj-Nag_iisang_muli.mp3',
    'assets/audio/NeckDeep-A_part_of_me.mp3',
    'assets/audio/Oasis-Dont_look_back_in_anger.mp3'
  ];

  Future<void> play() async {
    await _audioPlayer.stop();
    await _audioPlayer
        .play(AssetSource(_playlist[_Index].replaceFirst('assets/', '')));
    setState(() {
      _isPlaying = true;
    });
  }

  void pause() {
    _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  void next() {
    setState(() {
      _Index = (_Index + 1) % _playlist.length;
    });
    play();
  }

  void prev() {
    setState(() {
      _Index = (_Index - 1 + _playlist.length) % _playlist.length;
    });
  }

  void togglePlayPause() {
    if (_isPlaying) {
      pause();
    } else {
      play();
    }
  }

  @override
  void delete() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite Songs'),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.music_note,
              size: 150,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Song ${_Index + 1}',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: prev,
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.black,
                      size: 40,
                    )),
                IconButton(
                    onPressed: togglePlayPause,
                    icon: Icon(
                      _isPlaying ? Icons.pause_circle : Icons.play_circle,
                      color: Colors.black,
                      size: 60,
                    )),
                IconButton(
                    onPressed: next,
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.black,
                      size: 40,
                    )),
              ],
            )
          ],
        ));
  }
}

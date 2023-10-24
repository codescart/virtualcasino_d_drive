import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundService {
  // private constructor
  SoundService._();
  /// Cached instance of [SoundService]
  static SoundService? _instance;
  /// return an instance of [SoundService]
  static SoundService get instance {


    // set the instance if it's null
    _instance ??= SoundService._();
    // return the instance
    return _instance!;
  }
}

class Sound extends StatefulWidget {
  const Sound({Key? key}) : super(key: key);

  @override
  State<Sound> createState() => _SoundState();
}

class _SoundState extends State<Sound> {


  final AudioCache _player = AudioCache();
  Future<void> loadSounds() async {

    await _player.load('audio/click_sound.mp3');
    print('pppp');
  }

  Future<void> playTapDownSound() async {

  }
  @override
  void initState() {
    loadSounds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Container(
            color: Colors.orange,
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: const Text(
              'Tap then Release Me!',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          onTap:(){
            playTapDownSound();
          }
          // onTapDown: (details) async {
          //   print('play sound when the user tap down on the button');
          //   await SoundService.instance.playTapDownSound();
          // },
          // onTapUp: (details) async {
          //   print('play sound when the user release the tap on the button');
          //   await SoundService.instance.playTapDownSound();
          // },
        ),
      ),
    );
  }
}

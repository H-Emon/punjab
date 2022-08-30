
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAudio extends StatelessWidget {
  final String  audioLink;
  HomeAudio({ required this.audioLink,Key? key}) : super(key: key);
  AudioPlayer advancedPlayer=AudioPlayer();

  Duration _duration=Duration.zero;
  Duration _posotion=Duration.zero;
  bool isPlaying=false;
  bool isPaused=false;
  bool isLoop=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
        children: [
          Text('${_posotion}'),
          Text('${_duration-_posotion}'),
          FloatingActionButton(
            onPressed:(){
              advancedPlayer.play(audioLink);
            },
          ),
          FloatingActionButton(
            onPressed:(){
              advancedPlayer.pause();
            },
          ),
        ],
      ),
    );
  }
}





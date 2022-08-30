import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayRadioScreen extends StatefulWidget {

 const PlayRadioScreen({ Key? key}) : super(key: key);

  @override
  State<PlayRadioScreen> createState() => _PlayRadioScreenState();
}

class _PlayRadioScreenState extends State<PlayRadioScreen> {
  AudioPlayer advancedPlayer=AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          SizedBox(
            height:200,
          ),
          FloatingActionButton(
            onPressed:() {}
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



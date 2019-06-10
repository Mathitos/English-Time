import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: EnglishButton(),
      ),
    );
  }
}

void playSound() {
  Fluttertoast.showToast(
    msg: "should play a sound",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM, // also possible "TOP" and "CENTER"
    backgroundColor: new Color(0xffe74c3c),
    textColor: new Color(0xffffffff),
  );
  // AudioPlayer audioPlayer = AudioPlayer();
  // audioPlayer.play("assets/english-motherfucker-do-you-speak-it.mp3");
}

class EnglishButton extends StatelessWidget {
  EnglishButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: playSound,
        child:
            const Text('English MotherFucker', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

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

showToaster(String text, int color) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM, // also possible "TOP" and "CENTER"
    backgroundColor: new Color(color),
    textColor: new Color(0xffffffff),
  );
}

showSucessToaster(String text) {
  showToaster(text, 0xff32CD32);
}

showErrorToaster(String text) {
  showToaster(text, 0xffe74c3c);
}

class EnglishButton extends StatefulWidget {
  const EnglishButton({Key key}) : super(key: key);

  @override
  _EnglishButtonState createState() => _EnglishButtonState();
}

class _EnglishButtonState extends State<EnglishButton> {
  AudioPlayer audioPlugin = AudioPlayer();
  String mp3Uri;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<Null> _load() async {
    final ByteData data = await rootBundle
        .load('assets/english-motherfucker-do-you-speak-it.mp3');
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/demo.mp3');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    mp3Uri = tempFile.uri.toString();
    print('finished loading, uri=$mp3Uri');
  }

  void _playSound() {
    if (mp3Uri != null) {
      audioPlugin.play(mp3Uri, isLocal: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: _playSound,
        child:
            const Text('English MotherFucker', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

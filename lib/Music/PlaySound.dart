import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PlaySoundScreen extends StatefulWidget {
  @override
  _PlaySoundScreenState createState() => _PlaySoundScreenState();
}

class _PlaySoundScreenState extends State<PlaySoundScreen> {
  Duration _duration = Duration();
  Duration _position = Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = AudioPlayer();
    advancedPlayer.setReleaseMode(ReleaseMode.LOOP);
    audioCache = AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });

    advancedPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }

  String localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: children
                .map((w) => Container(child: w, padding: EdgeInsets.all(6),))
                .toList(),
          ),
        )
      ],
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 48,
      child: Container(
        width: 150,
        height: 45,
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Text(txt),
          color: Colors.pink[900],
          textColor: Colors.white,
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget slider() {
    return Slider(
      activeColor: Colors.black,
      inactiveColor: Colors.pink,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          seekToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  Widget LocalAudio() {
    return _tab([
      _btn('Remote URL PLay', () => advancedPlayer.play('https://firebasestorage.googleapis.com/v0/b/goshuin-dev.appspot.com/o/uminokoe.mp3?alt=media&token=229e469e-af07-40a3-bc4f-80567e89ba12')),
      _btn('Play', () => audioCache.play('uminokoe.mp3')),
      _btn('Pause', () => advancedPlayer.pause()),
      _btn(('Stop'), () => advancedPlayer.stop()),
      slider()
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.teal,
          title: Center(child: Text('LOCAL AUDIO'),),
        ),
        body: TabBarView(
          children: <Widget>[LocalAudio()],
        ),
      ),
    );
  }
}
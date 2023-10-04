import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

// ignore: must_be_immutable
class CameraScreen extends StatefulWidget {
  VlcPlayerController vlcViewController;

  CameraScreen({super.key, required this.vlcViewController});

  @override
  _CameraScreenState createState() {
    return _CameraScreenState(vlcViewController);
  }
}

class _CameraScreenState extends State<CameraScreen> {
  VlcPlayerController vlcViewController;
  _CameraScreenState(this.vlcViewController);
  // ignore: prefer_final_fields

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Robot Camera"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            VlcPlayer(
              controller: vlcViewController,
              aspectRatio: 16 / 9,
              placeholder: const Text("loading stream"),
            ),
          ],
        ),
      ),
    );
  }
}

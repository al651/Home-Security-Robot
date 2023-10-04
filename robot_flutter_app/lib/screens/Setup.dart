import 'package:flutter/material.dart';
import 'package:robot_app/main.dart';
import 'package:robot_app/screens/Camera.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  final myController = TextEditingController();

  String camIP = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Setup'),
      ),
      drawer: const TopLeftDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: TextField(
              controller: myController,
              keyboardType: TextInputType.number,
              maxLength: 15,
              onChanged: (text) {
                camIP = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter the IP address',
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                VlcPlayerController vlcViewController =
                    VlcPlayerController.network(
                  "rtsp://$camIP:554/mjpeg/1",
                  autoPlay: true,
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        CameraScreen(vlcViewController: vlcViewController),
                  ),
                );
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

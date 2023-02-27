import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:ntua_hci_moosik/wearos/Build_Song_Wear.dart';

class WearWatchAmbient extends StatelessWidget {
  const WearWatchAmbient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: WatchShape(
            builder: (BuildContext context, WearShape shape, Widget? child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BuildSongWear(color: const Color(0xfffb5a00), title: 'Song Title'),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:ntua_hci_moosik/wearos/Build_Song_Wear.dart';
import 'package:ntua_hci_moosik/wearos/Choose_Song.dart';

class WearWatchActive extends StatelessWidget {
  const WearWatchActive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: WatchShape(
            builder: (BuildContext context, WearShape shape, Widget? child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BuildSongWear(color: const Color(0xfffb5a00), title: 'Song Title'),
                  IconButton(
                    onPressed: () => [
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseSong()),
                      ),
                    ],
                    icon: const Icon(
                      Icons.circle,
                      color: Color(0xfffb5a00),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

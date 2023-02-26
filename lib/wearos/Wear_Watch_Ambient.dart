import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

/*class WearWatchAmbient extends StatefulWidget {
  const WearWatchAmbient({Key? key}) : super(key: key);

  @override
  State<WearWatchAmbient> createState() => _WearWatchAmbientState();
}

class _WearWatchAmbientState extends State<WearWatchAmbient> {
  @override
  Widget build(BuildContext context) => WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Text('test'),
            ),
          );
        },
      );
}
*/
class WearWatchAmbient extends StatelessWidget {


  const WearWatchAmbient( {Key? key}) : super(key: key);

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
                  Text(
                    'Shape: ${shape == WearShape.round ? 'round' : 'square'}',
                  ),
                  child!,
                ],
              );
            },
            child: AmbientMode(
              builder: (BuildContext context, WearMode mode, Widget? child) {
                return Text(
                  'Mode: ${mode == WearMode.active ? 'Active' : 'Ambient'}',
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:ntua_hci_moosik/wearos/Wear_Watch_Active.dart';

class CircleButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const CircleButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: color,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20.0),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w900,
          ),
        ),);
  }
}

class ChooseSong extends StatelessWidget {
  const ChooseSong({Key? key}) : super(key: key);
  final double pixels = 25;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: WatchShape(
            builder: (BuildContext context, WearShape shape, Widget? child) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                  child: Transform.scale(
                    scale: 0.9,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleButton(
                              text: "Happy",
                              color: const Color(0xfffb5a00),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const WearWatchActive(),
                                  ),
                                );
                              },
                            ),
                            const Spacer(),
                            CircleButton(
                              text: "Sad",
                              color: const Color(0xfffb5a00),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const WearWatchActive(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            CircleButton(
                              text: "Excited",
                              color: const Color(0xfffb5a00),
                              onPressed: () {
                                //send 'Excited' to android
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const WearWatchActive(),
                                  ),
                                );
                              },
                            ),
                            const Spacer(),
                            CircleButton(
                              text: "Angry",
                              color: const Color(0xfffb5a00),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const WearWatchActive(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

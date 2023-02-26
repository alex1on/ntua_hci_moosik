import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:google_fonts/google_fonts.dart';

/*class WearWatchActive extends StatefulWidget {
  const WearWatchActive({Key? key}) : super(key: key);

  @override
  State<WearWatchActive> createState() => _WearWatchActiveState();
}

class _WearWatchActiveState extends State<WearWatchActive> {
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
}*/
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
                    Text(
                      'Shape: ${shape == WearShape.round ? 'round' : 'square'} \n',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xf7fc5b00),
                      ),
                    ),
                    child!,
                  ],
                );
              },
              child: Text(
                textAlign: TextAlign.center,
                '\n Mode: Active\n This is Moodsik, WearOS.\nIt is finally done',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xf7fc5b00),
                ),
              )),
        ),
      ),
    );
  }
}

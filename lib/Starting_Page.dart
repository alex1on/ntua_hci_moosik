import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntua_hci_moosik/Landing_Page.dart';
import 'dart:async';



class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  void initState() {
    super.initState();

    // Wait for 2 seconds before navigating to the new page
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        width: 460,
        height: 944,
        color: const Color(0xff000000),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(64, 120, 70, 92),
              width: 460,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // logo
                      margin: const EdgeInsets.fromLTRB(0, 0, 57, 0),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xf7fc5b00),
                      ),
                    ),
                    RichText(
                      // moodsik
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          height: 1.2102272246,
                          color: const Color(0xf7ffffff),
                        ),
                        children: [
                          TextSpan(
                            text: 'Moo',
                            style: GoogleFonts.inter(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                              height: 1.2125,
                              color: const Color(0xf7ffffff),
                            ),
                          ),
                          TextSpan(
                            text: 'd',
                            style: GoogleFonts.vibur(
                              fontSize: 36,
                              fontWeight: FontWeight.w400,
                              height: 1.2575,
                              color: const Color(0xf7fc5b00),
                            ),
                          ),
                          TextSpan(
                            text: 'sik',
                            style: GoogleFonts.inter(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                              height: 1.2125,
                              color: const Color(0xf7ffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              // middle text 
              child: Container(
                margin: const EdgeInsets.fromLTRB(64, 5, 64, 72),
                width: 460,
                height: 70,
                child: Stack(
                  children: [
                    Positioned(
                      // ourmusic
                      left: 90,
                      top: 37,
                      child: Align(
                        child: SizedBox(
                          width: 173,
                          height: 39,
                          child: Text(
                            'Our Music.',
                            style: GoogleFonts.inter(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              height: 1.2125,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // yourmood
                      left: 0,
                      top: -5,
                      bottom: 5,
                      child: Align(
                        child: SizedBox(
                          width: 180,
                          height: 39,
                          child: Text(
                            'Your Mood.',
                            style: GoogleFonts.inter(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              height: 1.2125,
                              color: const Color(0xf7ffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Welcome',
                    style: GoogleFonts.roboto(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      height: 1.0526315789,
                      letterSpacing: 0.1000000015,
                      color: const Color(0xf7ffffff),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

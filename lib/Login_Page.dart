import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Default_Page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xff000000),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(64, 120, 70, 20),
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
            const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            Center(
              // login
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Log In',
                  style: GoogleFonts.roboto(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    height: 1.0526315789,
                    letterSpacing: 0.1000000015,
                    color: const Color(0xf7ffffff),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            Column(
              children: [
                Center(
                  // username or email
                  child: SizedBox(
                    width: 327,
                    child: TextField(
                      style: const TextStyle(
                        color: Color(0xff000000),
                        fontSize: 19,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w900,
                      ),
                      cursorColor: const Color(0xff000000),
                      cursorWidth: 3.0,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xfffb5a00),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        hintStyle: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 44, 41, 41),
                        ),
                        hintText: 'Username or Email',
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                Center(
                  // password
                  child: SizedBox(
                    width: 327,
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: const TextStyle(
                        color: Color(0xff000000),
                        fontSize: 19,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w900,
                      ),
                      cursorColor: const Color(0xff000000),
                      cursorWidth: 3.0,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xfffb5a00),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        hintStyle: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 44, 41, 41),
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                ElevatedButton(
                  onPressed: () {
                    // Make navigation to Default Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DefaultPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfffb5a00),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                  child: SizedBox(
                    // Continue
                    width: 105,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Continue',
                            style: GoogleFonts.inter(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                              height: 1.0526315789,
                              letterSpacing: 0.1000000015,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Color(0xff000000),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

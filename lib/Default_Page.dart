import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // defaultpageUgJ (266:7175)
            width: double.infinity,
            height: 944,
            decoration: BoxDecoration(
              color: const Color(0xff1f1d1d),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                Positioned(
                  // devicedeviceframevHQ (266:7176)
                  left: 11,
                  top: 9,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                    width: 439,
                    height: 925,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0x7fff3d00)),
                      color: const Color(0xff010000),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                Positioned(
                  // defaultsizeLtr (266:7177)
                  left: 0,
                  top: 71,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    width: 482,
                    height: 733,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogrouphsurzyQ (J5MawxaqMnKSu4ePBrhSUr)
                          margin: const EdgeInsets.fromLTRB(96, 0, 78, 7),
                          width: double.infinity,
                          height: 48,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // settingsKVt (266:7256)
                                margin: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: const SizedBox(
                                    width: 48,
                                    height: 48,
                                    child: Icon(
                                      Icons.settings,
                                      size: 24,
                                      color: Colors.grey
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // searchbardarkbyC (266:7255)
                                margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    width: 250,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff1c1b1f),
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    child: SizedBox(
                                      // statelayer6QA (I266:7255;52977:34209)
                                      width: 282,
                                      height: 48,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // autogroupeynncNW (J5Mb6YAsb3gm1b1VGuEYnn)
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 8, 33.5, 0),
                                            padding: const EdgeInsets.fromLTRB(
                                                21.5, 0, 0, 0),
                                            height: 40,
                                            child: Center(
                                              child: Text(
                                                'Search',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5,
                                                  letterSpacing: 0.5,
                                                  color: const Color(0xffcac4d0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // trailingelementsScS (I266:7255;52977:34213)
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 8),
                                            width: 88,
                                            child: Align(
                                              // sttrailingiconNkz (I266:7255;52977:34214)
                                              alignment: Alignment.centerRight,
                                              child: SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: Container(
                                                  margin: const EdgeInsets.fromLTRB(
                                                      0, 0, 24, 0),
                                                  child: const Icon(
                                                    Icons.search,
                                                    size: 24,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // ifeelGLa (266:7254)
                          margin: const EdgeInsets.fromLTRB(0, 0, 112, 22),
                          child: Text(
                            'I feel...',
                            style: GoogleFonts.inter(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              height: 1.2102272511,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          // feelingsplaylistsZaa (266:7249)
                          margin: const EdgeInsets.fromLTRB(140, 0, 67, 45),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupncptsbG (J5MgBeC9zsQNAK8w5hNcPt)
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                                width: double.infinity,
                                height: 40,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // happybutton1Sa (266:7253)
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 17, 0),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          width: 125,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: const Color(0xfffb5a00),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Center(
                                              child: Text(
                                                'Happy',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.inter(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w900,
                                                  height: 0.7142857143,
                                                  letterSpacing: 0.1000000015,
                                                  color: const Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      // sadbuttonekS (266:7252)
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        width: 125,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: const Color(0xfffb5a00),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Center(
                                            child: Text(
                                              'Sad',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.inter(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w900,
                                                height: 0.7142857143,
                                                letterSpacing: 0.1000000015,
                                                color: const Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                // autogroupml4zhyc (J5MgKJe4761AkJ6x1kmL4z)
                                width: double.infinity,
                                height: 40,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // excitedbuttonTSz (266:7251)
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 17, 0),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              9.5, 10, 9.5, 10),
                                          width: 125,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: const Color(0xfffb5a00),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            // labeltextMHU (I266:7251;50716:11408)
                                            child: Center(
                                              child: SizedBox(
                                                child: Container(
                                                  constraints: const BoxConstraints(
                                                    maxWidth: 106,
                                                  ),
                                                  child: Text(
                                                    'Excited',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.inter(
                                                      fontSize: 28,
                                                      fontWeight: FontWeight.w900,
                                                      height: 0.7142857143,
                                                      letterSpacing: 0.1000000015,
                                                      color:
                                                          const Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      // angrybutton2eW (266:7250)
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        width: 125,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: const Color(0xfffb5a00),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Center(
                                            child: Text(
                                              'Angry',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.inter(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w900,
                                                height: 0.7142857143,
                                                letterSpacing: 0.1000000015,
                                                color: const Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // smartwatchuiVY6 (266:7186)
                          margin: const EdgeInsets.fromLTRB(0, 0, 2, 31),
                          width: 472,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // suggestionfornowDiz (266:7248)
                                margin: const EdgeInsets.fromLTRB(0, 0, 29, 19),
                                child: Text(
                                  'Suggestion for now...',
                                  style: GoogleFonts.inter(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2102272511,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                              SizedBox(
                                // autogroupjfceLoc (J5McE1HndjFKN5zvtaJFce)
                                width: double.infinity,
                                height: 261,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // picturecircle5WJ (266:7187)
                                      left: 137,
                                      top: 33,
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            26, 21, 25, 20),
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: const Color(0xfffb5a00),
                                          borderRadius: BorderRadius.circular(100),
                                          image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('images/moosik.jpg'),
                                          ),
                                        ),
                                        child: Center(
                                          // playandpause8jU (I266:7187;170:9209)
                                          child: SizedBox(
                                            width: 149,
                                            height: 159,
                                            child: TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                              ),
                                              child: Image.asset(
                                                'images/moosik.jpg',
                                                width: 149,
                                                height: 159,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // Qgz (266:7188)
                                      left: 76,
                                      top: 220,
                                      child: Align(
                                        child: SizedBox(
                                          width: 66,
                                          height: 23,
                                          child: Text(
                                            '100/60',
                                            style: GoogleFonts.roboto(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              height: 1.5,
                                              color: const Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // mmhgudk (266:7189)
                                      left: 75,
                                      top: 243,
                                      child: Align(
                                        child: SizedBox(
                                          width: 57,
                                          height: 18,
                                          child: Text(
                                            'mmHG',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              height: 1.171875,
                                              color: const Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // zfC (266:7190)
                                      left: 33,
                                      top: 221,
                                      child: Align(
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: Image.asset(
                                            'images/moosik.jpg',
                                            width: 40,
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // tVg (266:7191)
                                      left: 348,
                                      top: 231,
                                      child: Align(
                                        child: SizedBox(
                                          width: 38,
                                          height: 30,
                                          child: RichText(
                                            text: TextSpan(
                                              style: GoogleFonts.bigShouldersText(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5,
                                                color: const Color(0xffffea7b),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: '98 ',
                                                  style:
                                                      GoogleFonts.bigShouldersText(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                    color: const Color(0xffffea7b),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '%',
                                                  style:
                                                      GoogleFonts.bigShouldersText(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                    color: const Color(0x7fffffff),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // spo24BC (266:7192)
                                      left: 343,
                                      top: 207,
                                      child: Align(
                                        child: SizedBox(
                                          width: 39,
                                          height: 30,
                                          child: Text(
                                            'spO2',
                                            style: GoogleFonts.bigShouldersText(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                              height: 1.5,
                                              color: const Color(0xff00ff93),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // frameAk2 (266:7193)
                                      left: 388,
                                      top: 213,
                                      child: Align(
                                        child: SizedBox(
                                          width: 39,
                                          height: 37,
                                          child: Image.asset(
                                            'images/moosik.jpg',
                                            width: 39,
                                            height: 37,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // groupTz2 (266:7205)
                                      left: 0,
                                      top: 0,
                                      child: SizedBox(
                                        width: 306,
                                        height: 54,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // bpmzj4 (266:7206)
                                              left: 95,
                                              top: 36,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 30,
                                                  height: 18,
                                                  child: Text(
                                                    'bpm',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.1725,
                                                      color:
                                                          const Color(0xffff0000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // Uu8 (266:7207)
                                              left: 0,
                                              top: 0,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 306,
                                                  height: 51.82,
                                                  child: Text(
                                                    '97',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 36,
                                                      fontWeight: FontWeight.w700,
                                                      height: 1.171875,
                                                      color:
                                                          const Color(0xffff0000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // vectorz6n (266:7208)
                                              left: 44.3657226562,
                                              top: 8.3674316406,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 37.27,
                                                  height: 36.27,
                                                  child: Image.asset(
                                                    'images/moosik.jpg',
                                                    width: 37.27,
                                                    height: 36.27,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // vectorMrS (266:7209)
                                              left: 44,
                                              top: 8,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 38,
                                                  height: 37,
                                                  child: Image.asset(
                                                    'images/moosik.jpg',
                                                    width: 38,
                                                    height: 37,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // devicethermostatHk6 (266:7210)
                                      left: 381,
                                      top: 5,
                                      child: Align(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.asset(
                                            'images/moosik.jpg',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // c98fBqU (266:7213)
                                      left: 341,
                                      top: 5,
                                      child: Align(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Text(
                                            '36,7°C\n98°F',
                                            style: GoogleFonts.bigShouldersText(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                              height: 1.25,
                                              color: const Color(0xffff0000),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // vectorgGS (266:7214)
                                      left: 42,
                                      top: 5,
                                      child: Align(
                                        child: SizedBox(
                                          width: 384,
                                          height: 256,
                                          child: Image.asset(
                                            'images/moosik.jpg',
                                            width: 384,
                                            height: 256,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // groupPwY (266:7215)
                                      left: 123,
                                      top: 21,
                                      child: SizedBox(
                                        width: 230,
                                        height: 130.71,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // autogroupzmhcuQ6 (J5Md2ZnYGF9v2sQowjZMhc)
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 23.48, 3.3, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // autogroupqaanEhG (J5MdKJoeJUp8HrQtW6qaaN)
                                                    margin:
                                                        const EdgeInsets.fromLTRB(
                                                            9.15, 0, 0, 0.49),
                                                    width: 36.12,
                                                    height: 47.27,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          // eYhx (266:7221)
                                                          left: 0,
                                                          top: 36.815864563,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 14.29,
                                                              height: 10.45,
                                                              child: Text(
                                                                'e',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height:
                                                                      1.2102272034,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // nFcN (266:7222)
                                                          left: 5.6166992188,
                                                          top: 25.5357437134,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 14.81,
                                                              height: 12.21,
                                                              child: Text(
                                                                'n',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height:
                                                                      1.2102272034,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // tXJz (266:7223)
                                                          left: 13.0881347656,
                                                          top: 17.5289611816,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 4,
                                                              height: 13,
                                                              child: Text(
                                                                't',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1.2125,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // mQdg (266:7225)
                                                          left: 26.1223144531,
                                                          top: 0,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 10,
                                                              height: 13,
                                                              child: Text(
                                                                'M',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1.2125,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    // autogroupah9cXCW (J5MdTUEi7T72SK3ryRah9C)
                                                    width: 10.17,
                                                    height: 59.47,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          // fJi (266:7216)
                                                          left: 0.6379394531,
                                                          top: 46.4734197259,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 7,
                                                              height: 13,
                                                              child: Text(
                                                                '#',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1.2125,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // cyaJ (266:7217)
                                                          left: 0,
                                                          top: 33.9354076385,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 8,
                                                              height: 13,
                                                              child: Text(
                                                                'C',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1.2125,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // uVYe (266:7218)
                                                          left: 0.3540039062,
                                                          top: 21.0858020782,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 7,
                                                              height: 13,
                                                              child: Text(
                                                                'u',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1.2125,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // rZYW (266:7219)
                                                          left: 2.3056640625,
                                                          top: 10.3698387146,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 5,
                                                              height: 13,
                                                              child: Text(
                                                                'r',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1.2125,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // rU9g (266:7220)
                                                          left: 5.1677246094,
                                                          top: 0,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 5,
                                                              height: 13,
                                                              child: Text(
                                                                'r',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1.2125,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // autogroupuvnexqY (J5MdixnttoXzo6sYgdUvne)
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 9.84, 5.58, 0),
                                              width: 18.79,
                                              height: 20,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    // oHsp (266:7226)
                                                    left: 0,
                                                    top: 6.1303253174,
                                                    child: Align(
                                                      child: SizedBox(
                                                        width: 13.27,
                                                        height: 13.87,
                                                        child: Text(
                                                          'o',
                                                          style: GoogleFonts.inter(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.2102272034,
                                                            color: const Color(
                                                                0xffffffff),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    // obdc (266:7227)
                                                    left: 11.7868652344,
                                                    top: 0,
                                                    child: Align(
                                                      child: SizedBox(
                                                        width: 7,
                                                        height: 13,
                                                        child: Text(
                                                          'o',
                                                          style: GoogleFonts.inter(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.2125,
                                                            color: const Color(
                                                                0xffffffff),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // dtci (266:7228)
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 5.14, 24.41, 0),
                                              child: Text(
                                                'd',
                                                style: GoogleFonts.inter(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2125,
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // 2D8 (266:7231)
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0.06, 6.04, 0),
                                              child: Text(
                                                '#',
                                                style: GoogleFonts.inter(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2125,
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // mxMg (266:7232)
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 5.38, 0),
                                              child: Text(
                                                'M',
                                                style: GoogleFonts.inter(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2125,
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // uHPx (266:7233)
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 1.73, 5, 0),
                                              child: Text(
                                                'u',
                                                style: GoogleFonts.inter(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2125,
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // sQzN (266:7234)
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 4.82, 4.65, 0),
                                              child: Text(
                                                's',
                                                style: GoogleFonts.inter(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2125,
                                                  color: const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // autogrouptd149h4 (J5MdvHoMVDCqVFRvEdTD14)
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 8.93, 3.58, 0),
                                              width: 20.09,
                                              height: 22.94,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    // i5qc (266:7235)
                                                    left: 0,
                                                    top: 0,
                                                    child: Align(
                                                      child: SizedBox(
                                                        width: 8.16,
                                                        height: 12.18,
                                                        child: Text(
                                                          'i',
                                                          style: GoogleFonts.inter(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.2102272034,
                                                            color: const Color(
                                                                0xffffffff),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    // cb3G (266:7236)
                                                    left: 7.3784179688,
                                                    top: 3.7954711914,
                                                    child: Align(
                                                      child: SizedBox(
                                                        width: 11.89,
                                                        height: 13.4,
                                                        child: Text(
                                                          'c',
                                                          style: GoogleFonts.inter(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.2102272034,
                                                            color: const Color(
                                                                0xffffffff),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // autogroupigv8JCa (J5Me9T66KiQhEUnU6biGV8)
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 24.12, 0, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    // autogroupg7keQWW (J5MePcMAZizk6fUw36g7ke)
                                                    margin:
                                                        const EdgeInsets.fromLTRB(
                                                            0, 0, 7.02, 1.18),
                                                    width: 43.89,
                                                    height: 51.11,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          // sin6 (266:7238)
                                                          left: 0,
                                                          top: 0,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 14.02,
                                                              height: 13.65,
                                                              child: Text(
                                                                'S',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height:
                                                                      1.2102272034,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // u33g (266:7239)
                                                          left: 9.1228027344,
                                                          top: 8.7933349609,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 14.49,
                                                              height: 13.24,
                                                              child: Text(
                                                                'u',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height:
                                                                      1.2102272034,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // g96i (266:7240)
                                                          left: 17.1806640625,
                                                          top: 18.6775512695,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 14.75,
                                                              height: 12.64,
                                                              child: Text(
                                                                'g',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height:
                                                                      1.2102272034,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // gcFC (266:7241)
                                                          left: 24.0561523438,
                                                          top: 29.5088806152,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 7,
                                                              height: 13,
                                                              child: Text(
                                                                'g',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1.2125,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // eWrN (266:7242)
                                                          left: 29.6401367188,
                                                          top: 41.0964355469,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 14.25,
                                                              height: 10.01,
                                                              child: Text(
                                                                'e',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height:
                                                                      1.2102272034,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    // autogroupl2mpdAJ (J5MeYMbbMubRQ1jgyEL2Mp)
                                                    margin:
                                                        const EdgeInsets.fromLTRB(
                                                            0, 0, 1.31, 3.67),
                                                    width: 16.04,
                                                    height: 17.45,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          // skVp (266:7243)
                                                          left: 0,
                                                          top: 0,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 6,
                                                              height: 13,
                                                              child: Text(
                                                                's',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1.2125,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // tsaS (266:7244)
                                                          left: 2.7138671875,
                                                          top: 11.5042724609,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 13.33,
                                                              height: 5.95,
                                                              child: Text(
                                                                't',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height:
                                                                      1.2102272034,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    // autogroup2pcnYwU (J5MecBpYR1tph1DhSG2PCN)
                                                    margin:
                                                        const EdgeInsets.fromLTRB(
                                                            0, 0, 0, 4.34),
                                                    width: 13.32,
                                                    height: 15.83,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          // ignn (266:7245)
                                                          left: 0,
                                                          top: 0,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 3,
                                                              height: 13,
                                                              child: Text(
                                                                'i',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1.2125,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          // oosQ (266:7246)
                                                          left: 0.3920898438,
                                                          top: 8.6108636856,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 12.93,
                                                              height: 7.22,
                                                              child: Text(
                                                                'o',
                                                                style: GoogleFonts
                                                                    .inter(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height:
                                                                      1.2102272034,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    // nKqk (266:7247)
                                                    margin:
                                                        const EdgeInsets.fromLTRB(
                                                            0, 0, 7.34, 0),
                                                    child: Text(
                                                      'n',
                                                      style: GoogleFonts.inter(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w700,
                                                        height: 1.2125,
                                                        color:
                                                            const Color(0xffffffff),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // myplaylistsed8 (266:7185)
                          margin: const EdgeInsets.fromLTRB(0, 0, 24, 8),
                          child: Text(
                            'My Playlists...',
                            style: GoogleFonts.inter(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              height: 1.2125,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          // playlistsYyQ (266:7179)
                          margin: const EdgeInsets.fromLTRB(91, 0, 0, 22),
                          width: 383,
                          height: 150,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                // playlist2stackedcarddark5Ce (266:7180)
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: SizedBox(
                                  width: 100,
                                  height: double.infinity,
                                  child: Container(
                                    // playlist2stackedcarddarkBmU (I266:7180;170:7800)
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      // cardoutlinedwVk (I266:7180;170:7801)
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff49454f)),
                                        color: const Color(0xff1c1b1f),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Container(
                                        // contentcontainer5rr (I266:7180;170:7802)
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xff49454f)),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: SizedBox(
                                          // mediatextcontentSSW (I266:7180;170:7803)
                                          width: 103,
                                          height: 123,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                // mediaaoc (I266:7180;170:7804)
                                                width: double.infinity,
                                                height: 99,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      // mediaXyk (I266:7180;170:7805)
                                                      left: 0,
                                                      top: 0,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 100,
                                                          height: 99,
                                                          child: Image.asset(
                                                            'images/moosik.jpg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // iconsmorevert24pxFPx (I266:7180;170:7738)
                                                      left: 79,
                                                      top: 3,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 24,
                                                          height: 24,
                                                          child: TextButton(
                                                            onPressed: () {},
                                                            style: TextButton
                                                                .styleFrom(
                                                              padding:
                                                                  EdgeInsets.zero,
                                                            ),
                                                            child: Image.asset(
                                                              'images/moosik.jpg',
                                                              width: 24,
                                                              height: 24,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                // title8Tk (I266:7180;170:7808)
                                                margin: const EdgeInsets.fromLTRB(
                                                    0, 0, 5, 0),
                                                child: Text(
                                                  'Playlist',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    letterSpacing: 0.5,
                                                    color: const Color(0xffe6e1e5),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 31,
                              ),
                              TextButton(
                                // playlist2stackedcarddarkprN (266:7181)
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: SizedBox(
                                  width: 100,
                                  height: double.infinity,
                                  child: Container(
                                    // playlist2stackedcarddarkYnN (I266:7181;170:7800)
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      // cardoutlined4ki (I266:7181;170:7801)
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff49454f)),
                                        color: const Color(0xff1c1b1f),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Container(
                                        // contentcontainerR5U (I266:7181;170:7802)
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xff49454f)),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: SizedBox(
                                          // mediatextcontentNWW (I266:7181;170:7803)
                                          width: 103,
                                          height: 123,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                // mediaKRk (I266:7181;170:7804)
                                                width: double.infinity,
                                                height: 99,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      // mediaH7g (I266:7181;170:7805)
                                                      left: 0,
                                                      top: 0,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 100,
                                                          height: 99,
                                                          child: Image.asset(
                                                            'images/moosik.jpg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // iconsmorevert24pxori (I266:7181;170:7738)
                                                      left: 79,
                                                      top: 3,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 24,
                                                          height: 24,
                                                          child: TextButton(
                                                            onPressed: () {},
                                                            style: TextButton
                                                                .styleFrom(
                                                              padding:
                                                                  EdgeInsets.zero,
                                                            ),
                                                            child: Image.asset(
                                                              'images/moosik.jpg',
                                                              width: 24,
                                                              height: 24,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                // titleUxr (I266:7181;170:7808)
                                                margin: const EdgeInsets.fromLTRB(
                                                    0, 0, 5, 0),
                                                child: Text(
                                                  'Playlist',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    letterSpacing: 0.5,
                                                    color: const Color(0xffe6e1e5),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 31,
                              ),
                              TextButton(
                                // playlist2stackedcarddarkPa2 (266:7182)
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: SizedBox(
                                  width: 100,
                                  height: double.infinity,
                                  child: Container(
                                    // playlist2stackedcarddarki6W (I266:7182;170:7800)
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      // cardoutlinedsVC (I266:7182;170:7801)
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff49454f)),
                                        color: const Color(0xff1c1b1f),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Container(
                                        // contentcontainerE4r (I266:7182;170:7802)
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xff49454f)),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: SizedBox(
                                          // mediatextcontentZcv (I266:7182;170:7803)
                                          width: 108,
                                          height: 138,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                // mediagSe (I266:7182;170:7804)
                                                margin: const EdgeInsets.fromLTRB(
                                                    0, 0, 5, 0),
                                                width: 103,
                                                height: 99,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      // media1Uv (I266:7182;170:7805)
                                                      left: 0,
                                                      top: 0,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 100,
                                                          height: 99,
                                                          child: Image.asset(
                                                            'images/moosik.jpg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // iconsmorevert24pxXy4 (I266:7182;170:7738)
                                                      left: 79,
                                                      top: 3,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 24,
                                                          height: 24,
                                                          child: TextButton(
                                                            onPressed: () {},
                                                            style: TextButton
                                                                .styleFrom(
                                                              padding:
                                                                  EdgeInsets.zero,
                                                            ),
                                                            child: Image.asset(
                                                              'images/moosik.jpg',
                                                              width: 24,
                                                              height: 24,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                // titledFQ (I266:7182;170:7808)
                                                'Playlist',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5,
                                                  letterSpacing: 0.5,
                                                  color: const Color(0xffe6e1e5),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 31,
                              ),
                              TextButton(
                                // playlist2stackedcarddarkwWz (266:7183)
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: SizedBox(
                                  width: 100,
                                  height: double.infinity,
                                  child: Container(
                                    // playlist2stackedcarddarkGZG (I266:7183;170:7800)
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      // cardoutlined2HY (I266:7183;170:7801)
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff49454f)),
                                        color: const Color(0xff1c1b1f),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Container(
                                        // contentcontainerNcJ (I266:7183;170:7802)
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xff49454f)),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: SizedBox(
                                          // mediatextcontent8bU (I266:7183;170:7803)
                                          width: 103,
                                          height: 123,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // mediag7C (I266:7183;170:7804)
                                                padding: const EdgeInsets.fromLTRB(
                                                    79, 3, 0, 3),
                                                width: double.infinity,
                                                height: 99,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'images/moosik.jpg'),
                                                  ),
                                                ),
                                                child: Align(
                                                  // iconsmorevert24pxoSi (I266:7183;170:7738)
                                                  alignment: Alignment.topRight,
                                                  child: SizedBox(
                                                    width: 24,
                                                    height: 24,
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.fromLTRB(
                                                              0, 0, 0, 69),
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        style: TextButton.styleFrom(
                                                          padding: EdgeInsets.zero,
                                                        ),
                                                        child: Image.asset(
                                                          'images/moosik.jpg',
                                                          width: 24,
                                                          height: 24,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // title3bx (I266:7183;170:7808)
                                                margin: const EdgeInsets.fromLTRB(
                                                    0, 0, 5, 0),
                                                child: Text(
                                                  'Playlist',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    letterSpacing: 0.5,
                                                    color: const Color(0xffe6e1e5),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 31,
                              ),
                              TextButton(
                                // playlist2stackedcarddark3kN (266:7184)
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: SizedBox(
                                  width: 100,
                                  height: double.infinity,
                                  child: Container(
                                    // playlist2stackedcarddarknCA (I266:7184;170:7800)
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      // cardoutlinedvZG (I266:7184;170:7801)
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff49454f)),
                                        color: const Color(0xff1c1b1f),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Container(
                                        // contentcontainerGt2 (I266:7184;170:7802)
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xff49454f)),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: SizedBox(
                                          // mediatextcontentqRL (I266:7184;170:7803)
                                          width: 108,
                                          height: 138,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                // mediaCFt (I266:7184;170:7804)
                                                margin: const EdgeInsets.fromLTRB(
                                                    0, 0, 5, 0),
                                                padding: const EdgeInsets.fromLTRB(
                                                    79, 3, 0, 3),
                                                height: 99,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'images/moosik.jpg'),
                                                  ),
                                                ),
                                                child: Align(
                                                  // iconsmorevert24pxWXU (I266:7184;170:7738)
                                                  alignment: Alignment.topRight,
                                                  child: SizedBox(
                                                    width: 24,
                                                    height: 24,
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.fromLTRB(
                                                              0, 0, 0, 69),
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        style: TextButton.styleFrom(
                                                          padding: EdgeInsets.zero,
                                                        ),
                                                        child: Image.asset(
                                                          'images/moosik.jpg',
                                                          width: 24,
                                                          height: 24,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                // titlePbG (I266:7184;170:7808)
                                                'Playlist',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5,
                                                  letterSpacing: 0.5,
                                                  color: const Color(0xffe6e1e5),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // createplaylist8Yr (266:7178)
                          margin: const EdgeInsets.fromLTRB(91, 0, 273, 0),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 25,
                              decoration: BoxDecoration(
                                color: const Color(0xfffb5a00),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Center(
                                  child: Text(
                                    '+ Create playlist',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      height: 1.4285714286,
                                      letterSpacing: 0.1000000015,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // horizontalcarddarkNTC (I266:7257;138:7866)
                  left: 33,
                  top: 837,
                  child: Container(
                    width: 406,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      // cardelevatedWJW (I266:7257;138:7866;53219:27365)
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff1c1b1f),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x4c000000),
                            offset: Offset(0, 1),
                            blurRadius: 1,
                          ),
                          BoxShadow(
                            color: Color(0x26000000),
                            offset: Offset(0, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: SizedBox(
                        // statelayerNrW (I266:7257;138:7866;53219:27365;52350:28410)
                        width: double.infinity,
                        height: double.infinity,
                        child: Container(
                          // contentcontainerM4E (I266:7257;138:7866;53219:27366)
                          padding: const EdgeInsets.fromLTRB(16, 0, 18.04, 0),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff49454f)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SizedBox(
                            // contentrWn (I266:7257;138:7866;53219:27368)
                            width: double.infinity,
                            height: 92,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroupvknvQHQ (J5MgvTJ9rjdF8X1dbNVknv)
                                  padding: const EdgeInsets.fromLTRB(0, 22, 60, 22),
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // monogramk6N (I266:7257;138:7866;53219:27369)
                                        margin:
                                            const EdgeInsets.fromLTRB(0, 4, 16, 4),
                                        width: 40,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: const Color(0xfffb5a00),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Center(
                                            child: Text(
                                              'A',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5,
                                                letterSpacing: 0.150000006,
                                                color: const Color(0xff1c1b1f),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        // textRTQ (I266:7257;138:7866;53219:27372)
                                        width: 83,
                                        height: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // header9PQ (I266:7257;138:7866;53219:27373)
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 0, 4),
                                              child: Text(
                                                'Song name',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5,
                                                  letterSpacing: 0.150000006,
                                                  color: const Color(0xffe6e1e5),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              // subheadsqC (I266:7257;138:7866;53219:27374)
                                              width: double.infinity,
                                              child: Text(
                                                'Artist',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.roboto(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.4285714286,
                                                  letterSpacing: 0.25,
                                                  color: const Color(0xffe6e1e5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // frame2608514R62 (I266:7257;138:7866;53219:27376)
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0.66, 0),
                                  padding: const EdgeInsets.fromLTRB(42, 37, 24, 0),
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // icons02LCz (I266:7257;138:7866;53219:27379)
                                        margin:
                                            const EdgeInsets.fromLTRB(0, 0, 4, 41),
                                        width: 12,
                                        height: 14,
                                        child: Image.asset(
                                          'images/moosik.jpg',
                                          width: 12,
                                          height: 14,
                                        ),
                                      ),
                                      Container(
                                        // autogroupnq6nFar (J5MhBCNb5xX59bKszgNQ6n)
                                        margin:
                                            const EdgeInsets.fromLTRB(0, 1, 23, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              // iconsskippreviouszYS (I266:7257;138:7866;53219:27378)
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 0, 157),
                                              width: 12,
                                              height: 12,
                                              child: Image.asset(
                                                'images/moosik.jpg',
                                                width: 12,
                                                height: 12,
                                              ),
                                            ),
                                            Container(
                                              // materialsymbolsreplayVzz (I266:7257;138:7866;53219:27380)
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 5, 0),
                                              width: 30,
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // iconsskipnextqox (I266:7257;138:7866;53219:27377)
                                        margin:
                                            const EdgeInsets.fromLTRB(0, 0, 0, 41),
                                        width: 12,
                                        height: 12,
                                        child: Image.asset(
                                          'images/moosik.jpg',
                                          width: 12,
                                          height: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // vectoryfG (I266:7257;138:7866;53219:27375)
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                  width: 20.3,
                                  height: 22,
                                  child: Image.asset(
                                    'images/moosik.jpg',
                                    width: 20.3,
                                    height: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

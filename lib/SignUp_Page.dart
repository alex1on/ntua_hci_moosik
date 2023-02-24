import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntua_hci_moosik/SetUp_Page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _password = '';
  String _cpassword = '';
  String username = '';
  String email = '';
  String errorString = '';
  bool getstarted = false;
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String? _selectedGender;
  final List<String> _genders = [
    'Male',
    'Female',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xff000000),
        child: SingleChildScrollView(
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
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Sign Up',
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
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 327,
                      child: TextField(
                        onChanged: (String value) {
                          username = value;
                        },
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
                          hintText: 'Username',
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Center(
                    child: SizedBox(
                      width: 327,
                      child: TextField(
                        onChanged: (String email1) {
                          email = email1;
                        },
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
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Center(
                    child: SizedBox(
                      width: 327,
                      child: TextField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
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
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Center(
                    child: SizedBox(
                      width: 327,
                      child: TextField(
                        onChanged: (String cpassword) {
                          setState(
                            () {
                              _cpassword = cpassword;
                              if (cpassword != _password) {
                                errorString = 'Passwords must match';
                              } else {
                                errorString = '';
                              }
                            },
                          );
                        },
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
                            hintText: 'Confirm Password',
                            errorText: errorString),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Center(
                    child: SizedBox(
                      width: 327,
                      height: 48,
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 44, 41, 41),
                          ),
                          hintText: _selectedDate == null
                              ? 'Date of Birth'
                              : 'Date of Birth: ${_selectedDate.toString()}',
                          filled: true,
                          fillColor: const Color(0xfffb5a00),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                        ),
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Center(
                    child: SizedBox(
                      width: 327,
                      child: DropdownButtonFormField<String>(
                        style: const TextStyle(
                          color: Color(0xff000000),
                          fontSize: 19,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                        ),
                        dropdownColor: const Color(0xfffb5a00),
                        decoration: const InputDecoration(
                          hintText: 'Gender',
                          hintStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 44, 41, 41),
                          ),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color(0xfffb5a00),
                        ),
                        value: _selectedGender,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                        items: _genders.map((gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  ElevatedButton(
                    onPressed: () async {
                      getstarted = (email.isNotEmpty) &&
                          (username.isNotEmpty) &&
                          (_password.isNotEmpty) &&
                          (_password == _cpassword);
                      if (getstarted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SetUpPage()),
                        );
                      } else {
                        await showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Almost Done!'),
                              content: const Text(
                                  'Please insert your credentials correctly.\n Make sure that the passwords match, and that no field is empty'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfffb5a00),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    child: SizedBox(
                      width: 135,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Get Started!',
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
      ),
    );
  }
}

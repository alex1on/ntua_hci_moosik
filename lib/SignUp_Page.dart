import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntua_hci_moosik/SetUp_Page.dart';
import 'package:ntua_hci_moosik/main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  late SQLiteService sqLiteService;
  List<User> _users = <User>[];

  // data given by the user to sign up
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpasswordController = TextEditingController();
  final _emailController = TextEditingController();
  String? _selectedGender;
  DateTime? _selectedDate;

  // User object to pass to set up page
  late User _newUser = User(username: '', password: '', email: '');
  // playlists object to pass to set up page
  late List<Playlist> _defaultPlaylists = <Playlist>[];

  // function that creates four empty default playlists for the new user and adds them to the db
  void MakeDefaultPlaylists(int userID) async {
    Playlist _Happy = Playlist(title: 'Happy', userID: userID);
    Playlist _Sad = Playlist(title: 'Sad', userID: userID);
    Playlist _Excited = Playlist(title: 'Excited', userID: userID); 
    Playlist _Angry = Playlist(title: 'Angry', userID: userID);
    
    int Happy_id = await sqLiteService.addPlaylist(_Happy);
    int Sad_id = await sqLiteService.addPlaylist(_Sad);
    int Excited_id = await sqLiteService.addPlaylist(_Excited);
    int Angry_id = await sqLiteService.addPlaylist(_Angry);  

    _defaultPlaylists.add(Playlist(id: Happy_id ,title: 'Happy', userID: userID));
    _defaultPlaylists.add(Playlist(id: Sad_id ,title: 'Sad', userID: userID));
    _defaultPlaylists.add(Playlist(id: Excited_id, title: 'Excited', userID: userID));
    _defaultPlaylists.add(Playlist(id:Angry_id, title: 'Angry', userID: userID));
  }

  @override
  void initState() {
    super.initState();
    sqLiteService = SQLiteService();
    sqLiteService.initDB().whenComplete(() async {
      final users = await sqLiteService.getUsers();
      setState(() {
        _users = users;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Check if user with [enteredUsername] OR [enteredemail] already exists in database
  bool _UserExists() {
    final enteredUsername = _usernameController.text;
    final enteredemail = _emailController.text;
    final matchedUser = _users.any(
      (user) => user.username == enteredUsername || user.email == enteredemail,
    );

    if (matchedUser) {
      return true;
    } else {
      return false;
    }
  }

  String errorString = '';
  // boolean to check if each required field is filled
  bool getstarted = false;

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
                          // store username
                          _usernameController.text = value;
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
                          // store email
                          _emailController.text = email1;
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
                            // store password
                            _passwordController.text = value;
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
                              // check if password and confirm password fields match
                              _cpasswordController.text = cpassword;
                              if (cpassword != _passwordController.text) {
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
                          // store selected date
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
                            // store gender
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
                      // check if required fields are filled
                      getstarted = (_emailController.text.isNotEmpty) &&
                          (_usernameController.text.isNotEmpty) &&
                          (_passwordController.text.isNotEmpty) &&
                          (_passwordController.text ==
                              _cpasswordController.text);
                      if (!getstarted) {
                        // if not, then display a proper message
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
                      } else {
                        // otherwise, check if user with the username or email given, exists in db
                        if (_UserExists()) {
                          // if it does, then display proper message
                          await showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                    'Username or email already used!\nUse different username or email to complete your registration.'),
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
                        } else {
                          // otherwise, create the new user object, add new user to db and pass new user to set up page
                          _newUser = User(
                              username:_usernameController.text,
                              password:_passwordController.text,
                              email: _emailController.text,
                              dateOfBirth: _selectedDate,
                              gender:_selectedGender
                          );
                          final newID = await sqLiteService.addUser(_newUser);
                          _newUser.id = newID;
                          MakeDefaultPlaylists(newID);
                          _users.add(_newUser);
                          setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SetUpPage(user: _newUser, defaultPlaylists: _defaultPlaylists, index: 0,)),
                          );
                        }
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

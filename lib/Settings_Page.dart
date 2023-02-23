import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // variables for switches
  bool _isSwitchedWearable = false;
  bool _isSwitchedDevice = false;
  bool _sleepTimerSwitched = false;

  // text editing controller for username
  String _username = "JohnDoe";
  final TextEditingController _newUsernameController = TextEditingController();
  bool _isEditingUsername = false;

  // text editing controller for password
  String _password = "JohnDoe";
  final TextEditingController _newPasswordController = TextEditingController();
  bool _isEditingPassword = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _newUsernameController.dispose();
    super.dispose();
  }

  void dispose2() {
    // Clean up the controller when the widget is disposed.
    _newPasswordController.dispose();
    super.dispose();
  }

  void _toggleEditUsername() {
    setState(() {
      _isEditingUsername = !_isEditingUsername;
      if (_isEditingUsername) {
        _newUsernameController.text = "";
      }
    });
  }

  void _toggleEditPassword() {
    setState(() {
      _isEditingPassword = !_isEditingPassword;
      if (_isEditingPassword) {
        _newPasswordController.text = "";
      }
    });
  }

  void _saveNewUsername() {
    setState(() {
      _username = _newUsernameController.text;
      _isEditingUsername = false;
    });
  }

  void _saveNewPassword() {
    setState(() {
      _password = _newPasswordController.text;
      _isEditingPassword = false;
    });
  }

  void _cancelEditUsername() {
    setState(() {
      _isEditingUsername = false;
      _newUsernameController.text = "";
    });
  }

  void _cancelEditPassword() {
    setState(() {
      _isEditingPassword = false;
      _newPasswordController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 30.0),
                child: Text(
                  'Settings',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Text(
                  'Devices',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Connect to wearable',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Switch(
                      value: _isSwitchedWearable,
                      onChanged: (bool value) {
                        setState(() {
                          _isSwitchedWearable = value;
                        });
                      },
                      inactiveTrackColor: Colors.white,
                      activeTrackColor: Colors.orange[200],
                      activeColor: const Color(0xfffb5a00),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pair your smartwatch with the application.',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Connect to device',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Switch(
                      value: _isSwitchedDevice,
                      onChanged: (bool value) {
                        setState(() {
                          _isSwitchedDevice = value;
                        });
                      },
                      inactiveTrackColor: Colors.white,
                      activeTrackColor: Colors.orange[200],
                      activeColor: const Color(0xfffb5a00),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pair your phone with a Bluetooth device to listen\nto your music (speakers etc)',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sleep Timer',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Switch(
                      value: _sleepTimerSwitched,
                      onChanged: (bool value) {
                        setState(() {
                          _sleepTimerSwitched = value;
                        });
                      },
                      inactiveTrackColor: Colors.white,
                      activeTrackColor: Colors.orange[200],
                      activeColor: const Color(0xfffb5a00),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Set a timer for the music to automatically stop',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Text(
                  'Account',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 32.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Change username',
              //         style: GoogleFonts.inter(
              //           textStyle: const TextStyle(
              //             fontSize: 22.0,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // New Username
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfffb5a00),
                          ),
                          onPressed: _toggleEditUsername,
                          child: Text(
                            'Change username',
                            style: GoogleFonts.inter(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _isEditingUsername
                        ? Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xfffb5a00),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextField(
                                    controller: _newUsernameController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "New username",
                                      hintStyle: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: _saveNewUsername,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: const Icon(Icons.check),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: _cancelEditUsername,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: const Icon(Icons.close),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
              // New Password
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfffb5a00),
                          ),
                          onPressed: _toggleEditPassword,
                          child: Text(
                            'Change password',
                            style: GoogleFonts.inter(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _isEditingPassword
                        ? Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xfffb5a00),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextField(
                                    controller: _newPasswordController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "New password",
                                      hintStyle: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    obscureText: true,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: _saveNewPassword,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: const Icon(Icons.check),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: _cancelEditPassword,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: const Icon(Icons.close),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

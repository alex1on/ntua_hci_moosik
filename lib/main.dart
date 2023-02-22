import 'package:flutter/material.dart';
import 'package:ntua_hci_moosik/Landing_Page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moosik',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const LandingPage(),
    );
  }
}


/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Widget> pages = const [
    //LandingPage(),
    // SignUpPage(),
    // SetUpPgae(),
    // LoginPage(),
    // DefaultPage(),
    // SettingsPage(),
    // PlaylistPage(),
    // SearchPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
*/
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // SizedBox(
                //   width: 40.0,
                //   height: 40.0,
                //   child: Image.asset('images/moosik.jpg'),
                // ),
                SizedBox(width: 10.0),
                Text(
                  "Moosik",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Your Mood.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Our Music.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Navigate to the SignUpPage
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFC5B00),
                shape: const StadiumBorder(),
              ),
              child: const Text("SIGN UP"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the LoginPage
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFC5B00),
                shape: const StadiumBorder(),
              ),
              child: const Text("LOG IN"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zoozoowin_/otp.dart';
import 'package:zoozoowin_/phone.dart';
import 'package:zoozoowin_/username.dart';
import 'package:zoozoowin_/home.dart'; // Import the HomeScreen class

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Define the TextEditingController for the username
  TextEditingController usernameController = TextEditingController();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // Set initial route to 'splash'
    initialRoute: 'splash',
    routes: {
      'splash': (context) => SplashScreen(), // Add route for SplashScreen
      'phone': (context) => Myphone(usernameController: usernameController),
      'otp': (context) => Myotp(usernameController: usernameController),
      'username': (context) => Username(), // Add route for Username screen
      'home': (context) => HomeScreen(), // Add route for Home screen
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay for the splash screen
    Timer(Duration(seconds: 5), () {
      // Navigate to the next screen after the splash screen is displayed
      Navigator.pushReplacementNamed(context, 'phone');
    });
  }

   @override
  Widget build(BuildContext context) {
    // Replace this with your desired splash screen widget
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_image.png'), // Replace with your splash image
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
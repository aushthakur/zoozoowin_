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
    initialRoute: 'phone',
    routes: {
      'phone': (context) => Myphone(usernameController: usernameController),
      'otp': (context) => Myotp(usernameController: usernameController),
      'username': (context) => Username(), // Add route for Username screen
      'home': (context) => HomeScreen(), // Add route for Home screen
    },
  ));
}

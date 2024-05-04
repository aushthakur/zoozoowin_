import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoozoowin_/home.dart';
import 'package:zoozoowin_/phone.dart';
import 'package:zoozoowin_/username.dart';

class Myotp extends StatefulWidget {
  final TextEditingController usernameController; // Add this line

  Myotp({Key? key, required this.usernameController}) : super(key: key); // Modify the constructor

  @override
  _MyotpState createState() => _MyotpState();
}

class _MyotpState extends State<Myotp> {
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  Future<bool> checkIfUsernameExists(String username) async {
    // Check if the username exists in Firestore
    final usernameQuery = await FirebaseFirestore.instance
        .collection('username')
        .where('username', isEqualTo: username)
        .get();

    // Return true if username exists, false otherwise
    return usernameQuery.docs.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back button
        backgroundColor: const Color.fromARGB(255, 4, 26, 191),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Your logo widget here
            Image.asset(
              'assets/images/logo.png', // Replace 'assets/images/logo.png' with your logo image path
              width: 150,
              height: 110,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            // Your language change icon here
            IconButton(
              icon: Image.asset(
                'assets/images/language_icon.png', // Replace 'assets/images/language_icon.png' with the path to your language icon image
                width: 30,
                height: 30,
              ),
              onPressed: () {
                // Implement language change functionality here
              },
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fixed background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/background.jpg'), // Replace with your background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.8, // Adjust the width as needed
              height: MediaQuery.of(context).size.height *
                  0.3, // Adjust the height as needed
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(
                      0.5), // Adjust opacity as needed
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // OTP input boxes
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: 40,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: TextField(
                              controller:
                                  _otpControllers[index],
                              decoration:
                                  const InputDecoration(
                                hintText: '_',
                                hintStyle: TextStyle(
                                    fontSize:
                                        20), // Adjust font size of hint text
                                counterText: '',
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.center,
                              keyboardType:
                                  TextInputType.number,
                              maxLength: 1,
                              style: const TextStyle(
                                  fontSize:
                                      24), // Adjust font size of entered digits
                              onChanged: (value) {
                                if (value.length == 1 &&
                                    index < 5) {
                                  // Move focus to the next OTP input box
                                  FocusScope.of(context)
                                      .nextFocus();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Verify OTP button
                    ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                              setState(() {
                                _isLoading = true;
                              });

                              // Get the OTP entered by the user from text controllers
                              String smsCode = _otpControllers
                                  .map((controller) =>
                                      controller.text)
                                  .join();

                              try {
                                // Verify the OTP
                                PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                        verificationId:
                                            Myphone.verify,
                                        smsCode: smsCode);
                                await _auth.signInWithCredential(
                                    credential);

                                // Check if the user already has a username
                                bool usernameExists =
                                    await checkIfUsernameExists(
                                        widget
                                            .usernameController
                                            .text);

                                // Navigate accordingly
                                if (usernameExists) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(),
                                    ),
                                  );
                                } else {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Username(),
                                    ),
                                  );
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Invalid OTP. Please try again.'),
                                  ),
                                );

                                // Reset loading state after 1 second
                                Future.delayed(
                                  const Duration(seconds: 1),
                                  () {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  },
                                );
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, // Set the button's background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(
                            double.infinity,
                            50), // Increase button width
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.black,
                            )
                          : const Text(
                              'VERIFY OTP',
                              style: TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                    ),
                    const SizedBox(height: 10),
                    // Edit phone number text link
                    GestureDetector(
                      onTap: () {
                        // Navigate back to Myphone interface
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Edit phone number?',
                        style: TextStyle(
                          color: Colors.white,
                          decoration:
                              TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

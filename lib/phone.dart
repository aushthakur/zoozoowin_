import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoozoowin_/otp.dart';

class Myphone extends StatefulWidget {
  final TextEditingController usernameController; // Define usernameController here

  const Myphone({Key? key, required this.usernameController}) : super(key: key);

  static String verify = "";

  @override
  State<Myphone> createState() => _MyphoneState();
}

class _MyphoneState extends State<Myphone> {
  final TextEditingController _countryCodeController =
      TextEditingController(text: '+91');
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  0.2, // Adjust the height as needed
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:
                      Colors.black.withOpacity(0.5), // Adjust opacity as needed
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white
                                  .withOpacity(0.8), // Adjust opacity as needed
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              controller: _countryCodeController,
                              decoration: const InputDecoration(
                                hintText: 'XX',
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    4), // Limit input to 4 characters
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 7,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white
                                  .withOpacity(0.8), // Adjust opacity as needed
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              controller: _phoneNumberController,
                              decoration: const InputDecoration(
                                hintText: 'Phone Number',
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    10), // Limit input to 10 characters
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        String phoneNumber =
                            '${_countryCodeController.text} ${_phoneNumberController.text}';
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: phoneNumber,
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            Myphone.verify = verificationId;
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Myotp(
                                    usernameController: widget.usernameController),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white, // Set the button's background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(
                            double.infinity, 50), // Increase button width
                      ),
                      child: const Text(
                        'SEND OTP',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black),
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

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoozoowin_/home.dart';

class Username extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

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
                'assets/images/language_icon.png', // Replace with the path to your language icon image
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
                  'assets/images/background.jpg', // Replace with your background image path
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // Adjust the width as needed
              height: MediaQuery.of(context).size.height * 0.3, // Adjust the height as needed
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Content of your username screen
                    const Text(
                      'Enter Username',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Username input field
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Continue button
                    ElevatedButton(
                      onPressed: () {
                        if (_usernameController.text.isEmpty) {
                          // Show a snackbar asking the user to enter a username
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter a username to continue.'),
                            ),
                          );
                        } else {
                          // Username is not empty, continue
                          CollectionReference collRef = FirebaseFirestore.instance.collection('username');
                          collRef.add(
                            {
                              'username': _usernameController.text,
                            }
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Set the button's background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(double.infinity, 50), // Increase button width
                      ),
                      child: const Text(
                        'CONTINUE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
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

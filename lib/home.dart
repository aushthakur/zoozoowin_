import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/redbg.png', // Replace with your background image path
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blue container below the navbar
          Positioned(
            top: kToolbarHeight + 10,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 4, 26, 191),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Open wallet popup
                      // Implement wallet functionality
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/wallet_icon.png', // Replace 'assets/images/wallet_icon.png' with your wallet icon image path
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Amount in wallet', // Replace with amount in the wallet
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Open stripe payment gateway
                      // Implement add money functionality
                    },
                    child: Image.asset(
                      'assets/images/plus_icon.png', // Replace 'assets/images/plus_icon.png' with your plus icon image path
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zoozoowin_/game1.dart';
import 'package:zoozoowin_/payment.dart'; // Import the PaymentDialog widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _amountInWallet = 0.00;

 // Method to update wallet balance
  void updateWalletBalance(double amount) {
    setState(() {
      _amountInWallet -= amount;
    });
  }
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
              'assets/images/logo.png',
              width: 150,
              height: 110,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            // Your language change icon here
            IconButton(
              icon: Image.asset(
                'assets/images/language_icon.png',
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
                  'assets/images/redbg.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blue container below the navbar
          Positioned(
            top: kToolbarHeight + -30,
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
                      _showWalletDetails(context);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/wallet_icon.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '$_amountInWallet Rs.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _navigateToAddMoneyScreen(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Second AppBar with different options
          Positioned(
            top: kToolbarHeight + 50,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 4, 26, 191),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle result option
                    },
                    child: Text(
                      'Result',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle result history option
                    },
                    child: Text(
                      'Result History',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle how to play option
                    },
                    child: Text(
                      'How to Play',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        // Games options
          Positioned(
            top: kToolbarHeight + 110,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(height: 10),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Game1Screen()),
    );
                      },
                      child: Image.asset(
                        'assets/images/Game1.png',
                        width: 1000,
                        height: 100,
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        // Handle Game2 option
                      },
                      child: Image.asset(
                        'assets/images/Game2.png',
                        width: 1000,
                        height: 100,
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        // Handle Game3 option
                      },
                      child: Image.asset(
                        'assets/images/Game3.png',
                        width: 1000,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Add this code after the Games options Positioned widget
         Positioned(
  bottom: 0,
  left: 0,
  right: 0,
  child: Stack(
    children: [
      Image.asset(
        'assets/images/foot.png',
        fit: BoxFit.fitWidth,
      ),
      Positioned(
  bottom: 10,
  left: 35,
  child: GestureDetector(
    onTap: () {
      _showLogoutConfirmation(context);
    },
    child: Column(
      children: [
        Icon(Icons.logout, size: 40, color: Colors.white),
        SizedBox(height: 1),
        Text('Logout', style: TextStyle(color: Colors.white)),
      ],
    ),
  ),
),
     Positioned(
  bottom: 10,
  right: 30,
  child: GestureDetector(
    onTap: () {
      _showWithdrawalDialog(context);
    },
    child: Column(
      children: [
        Icon(Icons.monetization_on, size: 40, color: Colors.white), // Replace with your Withdraw icon
        SizedBox(height: 1),
        Text('Withdrawal', style: TextStyle(color: Colors.white)),
      ],
    ),
  ),
),

    ],
  ),
),


        ],
      ),
    );
  }

void _showLogoutConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false); // No
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true); // Yes
            },
            child: Text('Yes'),
          ),
        ],
      );
    },
  ).then((value) {
    if (value != null && value) {
      // If user selects Yes, redirect to phone.dart
      Navigator.pushReplacementNamed(context, '/phone');
    }
  });
}


void _showWithdrawalDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      double withdrawalAmount = 0.00;
      return AlertDialog(
        title: Text('Withdraw Amount'),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Current Amount in Wallet: ₹$_amountInWallet'),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Amount to Withdraw (₹)',
                  ),
                  onChanged: (value) {
                    withdrawalAmount = double.tryParse(value) ?? 0.00;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (withdrawalAmount <= _amountInWallet) {
                      setState(() {
                        _amountInWallet -= withdrawalAmount;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Withdrawal successful!'),
                      ));
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Insufficient balance!'),
                      ));
                    }
                  },
                  child: Text('Withdraw'),
                ),
              ],
            );
          },
        ),
      );
    },
  );
  showDialog(
    context: context,
    builder: (context) {
      return WithdrawDialog(
        currentAmount: _amountInWallet,
        onAmountWithdrawn: (amount) {
          if (amount <= _amountInWallet) {
            // Deduct the amount from the wallet balance
            updateWalletBalance(amount);
          }
        },
      );
    },
  );
}


  void _showWalletDetails(BuildContext context) {
    // Implement wallet details display
  }

  void _navigateToAddMoneyScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return PaymentDialog(
          onAmountEntered: (amount) {
            setState(() {
              _amountInWallet += amount;
            });
          },
        );
      },
    );
  }
}

class WithdrawDialog extends StatefulWidget {
  final double currentAmount;
  final Function(double) onAmountWithdrawn;

  const WithdrawDialog(
      {Key? key, required this.currentAmount, required this.onAmountWithdrawn})
      : super(key: key);
  @override
  _WithdrawDialogState createState() => _WithdrawDialogState();
}

class _WithdrawDialogState extends State<WithdrawDialog> {
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Withdraw Amount'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Current Amount in Wallet: ${widget.currentAmount} Rs.'),
          TextFormField(
            controller: _amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Enter Amount to Withdraw (Rs.)',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter amount';
              }
              double amount = double.parse(value);
              if (amount > widget.currentAmount) {
                return 'Withdrawal amount cannot exceed current amount';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_amountController.text.isNotEmpty) {
                double amount = double.parse(_amountController.text);
                widget.onAmountWithdrawn(amount);
                Navigator.pop(context);
              }
            },
            child: const Text('Withdraw'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}

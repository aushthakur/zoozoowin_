import 'package:flutter/material.dart';

class PaymentDialog extends StatefulWidget {
  final Function(double) onAmountEntered;

  const PaymentDialog({Key? key, required this.onAmountEntered}) : super(key: key);

  @override
  _PaymentDialogState createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Payment Method'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Select your payment method:'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _showAmountDialog(context, 'Google Pay');
            },
            child: const Text('Google Pay'),
          ),
          ElevatedButton(
            onPressed: () {
              _showAmountDialog(context, 'Phone Pay');
            },
            child: const Text('Phone Pay'),
          ),
          ElevatedButton(
            onPressed: () {
              _showAmountDialog(context, 'Paytm');
            },
            child: const Text('Paytm'),
          ),
          ElevatedButton(
            onPressed: () {
              _showAmountDialog(context, 'Bank Transfer');
            },
            child: const Text('Bank Transfer'),
          ),
        ],
      ),
    );
  }

  void _showAmountDialog(BuildContext context, String paymentMethod) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Amount for $paymentMethod'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Amount (Rs.)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_amountController.text.isNotEmpty) {
                    double amount = double.parse(_amountController.text);
                    widget.onAmountEntered(amount);
                    Navigator.pop(context); // Close the amount dialog
                    _showSuccessMessage(context); // Show success message
                  }
                },
                child: const Text('Add Money'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Amount added successfully.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the success message dialog
                Navigator.pop(context); // Close the payment method selection dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}

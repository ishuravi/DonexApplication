import 'package:flutter/material.dart';

class CreateReceiptPage extends StatefulWidget {
  @override
  _CreateReceiptPageState createState() => _CreateReceiptPageState();
}

class _CreateReceiptPageState extends State<CreateReceiptPage> {
  final TextEditingController _receiptNumberController = TextEditingController();
  final TextEditingController _partyNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _receiptAmountController = TextEditingController();
  final TextEditingController _transactionDateController = TextEditingController();
  final TextEditingController _bankController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Receipt',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF756AB6), // App bar color
      ),
      backgroundColor: Color(0xFFAC87C5), // Background color for the entire page
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Color(0xFFE0AED0), // Card background color
          elevation: 6, // Card elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  buildTextField('Party Name', _partyNameController),
                  buildTextField('City', _cityController),
                  buildTextField('PAN', _panController),
                  buildTextField('Receipt Amount', _receiptAmountController),
                  buildTextField('Transaction Date', _transactionDateController),
                  buildTextField('Bank', _bankController),
                  buildTextField('Payment mode', _receiptNumberController),
                  buildTextField('Deposit bank', _receiptNumberController),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Handle create button click
                        // You can save the receipt details or perform any necessary action
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Receipt Created!'),
                            backgroundColor: Color(0xFF7E6363), // SnackBar background color
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Create',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF756AB6), // Button color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: null, // Remove the label text
          hintText: 'Enter $label', // Placeholder text
          hintStyle: TextStyle(color: Colors.black), // Hint text color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.white30, // Text field background color
          errorStyle: TextStyle(color: Colors.white), // Error text color
        ),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CreateReceiptPage(),
  ));
}

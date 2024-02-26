import 'package:flutter/material.dart';
import 'receipt_details_page.dart'; // Import the ReceiptDetailsPage

class ReceiptListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt List'),
        backgroundColor: Color(0xFF8E7AB5), // Set app bar background color
        actions: [
          IconButton(
            icon: Icon(Icons.edit), // Edit icon
            onPressed: () {
              _showEditDialog(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of receipts
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  'Receipt #$index',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF512B81), // Set title text color
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReceiptDetailsPage(receiptNumber: '$index')), // Passing index as receipt number
                  );
                },
                trailing: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.green, // Set background color for amount
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '+\$100', // Example: Display the amount or any relevant info
                    style: TextStyle(
                      color: Colors.white, // Set text color
                      fontSize: 18, // Set font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Color(0xFFE493B3), // Set divider color
                thickness: 1.5, // Increase divider thickness
                height: 0, // Maintain default height
              ),
            ],
          );
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    String receiptNumber = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Receipt"),
          content: TextField(
            onChanged: (value) {
              receiptNumber = value;
            },
            decoration: InputDecoration(labelText: "Enter Receipt Number"),
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Confirm"),
              onPressed: () {
                // Navigate to ReceiptDetailsPage with the provided receipt number
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReceiptDetailsPage(receiptNumber: receiptNumber)),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class ReceiptDetailsPage extends StatelessWidget {
  final String receiptNumber; // Define receiptNumber parameter

  ReceiptDetailsPage({required this.receiptNumber}); // Constructor

  @override
  Widget build(BuildContext context) {
    // Implement your receipt details page UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt #$receiptNumber Details'),
        backgroundColor: Color(0xFF8E7AB5), // Set app bar background color
      ),
      body: Center(
        child: Text('Receipt Details for #$receiptNumber'),
      ),
    );
  }
}

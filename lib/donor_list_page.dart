import 'package:flutter/material.dart';
import 'donor_details_page.dart'; // Import DonorDetailsPage

// Dummy data representing donors and their basic information
List<Map<String, dynamic>> donors = [
  {'name': 'Priya', 'email': 'john@example.com', 'mobile': '1234567890'},
  {'name': 'riya', 'email': 'riya@example.com', 'mobile': '9876543231'},
  {'name': 'adithya', 'email': 'adithya@example.com', 'mobile': '9876543120'},
  {'name': 'ishu', 'email': 'ishu@example.com', 'mobile': '9876543510'},
  {'name': 'sai', 'email': 'sai@example.com', 'mobile': '987654360'},
];

class DonorListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor List'),
        backgroundColor: Color(0xFF8E7AB5), // App bar background color
      ),
      body: ListView.builder(
        itemCount: donors.length,
        itemBuilder: (context, index) {
          final donor = donors[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    donor['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[800]// Donor name text color
                    ),
                  ),
                  subtitle: Text(
                    donor['email'],
                    style: TextStyle(color: Colors.purple[800]),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DonorDetailsPage(donor: donor),
                      ),
                    );
                  },
                ),
                Divider(
                  color: Color(0xFFE443B9), // Divider color
                  thickness: 1.5, // Increase divider thickness
                  height: 0, // Maintain default height
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

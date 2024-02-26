import 'package:flutter/material.dart';

class DonorDetailsPage extends StatelessWidget {
  final Map<String, dynamic> donor;

  const DonorDetailsPage({Key? key, required this.donor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Name: ${donor['name']}'),
            subtitle: Text('Email: ${donor['email']}'),
          ),
          ListTile(
            title: Text('Mobile: ${donor['mobile']}'),
          ),
        ],
      ),
    );
  }
}

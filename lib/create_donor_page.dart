import 'package:flutter/material.dart';

class CreateDonorPage extends StatefulWidget {
  @override
  _CreateDonorPageState createState() => _CreateDonorPageState();
}

class _CreateDonorPageState extends State<CreateDonorPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _panNumberController = TextEditingController();

  String? _selectedState; // Track the selected state
  List<String> _states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar Haveli and Daman and Diu',
    'Delhi',
    'Lakshadweep',
    'Puducherry'
  ]; // List of states

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Donor',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFAC87C5), // App bar color
      ),
      backgroundColor: Color(0xFFE0AED0), // Background color for the entire page
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Color(0xFFFFE5E5), // Card background color
          elevation: 6, // Card elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTextField('Name', _nameController),
                    _buildTextField('Email', _emailController),
                    _buildTextField('Mobile', _mobileController, isNumeric: true),
                    _buildTextField('PAN Number', _panNumberController),
                    _buildTextField('Address', _addressController),
                    _buildDropdownField('State', _states, _selectedState, (value) {
                      setState(() {
                        _selectedState = value as String?;
                      });
                    }),
                    _buildTextField('City', _cityController),
                    _buildTextField('Pincode', _pincodeController, isNumeric: true),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Handle create button click
                          // You can save the donor details or perform any necessary action
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Donor Created!'),
                              backgroundColor: Color(0xFF756AB6), // SnackBar background color
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Create',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
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
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: label, // Use hintText instead of labelText
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(width: 1, color: Colors.black),
          ),
          filled: true,
          fillColor: Color(0xFFE0AED0), // Text field background color
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 15, // Label color
          ),
        ),
        style: TextStyle(color: Colors.black), // Text color
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please enter $label';
          }
          // Add numeric validation for phone number and pincode
          if (isNumeric) {
            final RegExp numericRegex = RegExp(r'^[0-9]+$');
            if (!numericRegex.hasMatch(value!)) {
              return 'Please enter a valid $label';
            }
          }
          // Validate PAN number format
          if (label == 'PAN Number') {
            final RegExp panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
            if (!panRegex.hasMatch(value!)) {
              return 'Please enter a valid $label';
            }
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdownField(
      String label,
      List<String> items,
      String? value,
      Function onChanged,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          hintText: label, // Use hintText instead of labelText
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(width: 1, color: Colors.purple),
          ),
          filled: true,
          fillColor: Color(0xFFE0AED0), // Dropdown field background color
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 15, // Label color
          ),
        ),
        value: value,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged as void Function(String?),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $label';
          }
          return null;
        },
        isExpanded: true,
      ),
    );
  }
}

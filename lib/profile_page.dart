import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the login page

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Display user information
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ListTile(
                  leading: CircleAvatar(
                    // Display user profile picture
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                    radius: 30,
                  ),
                  title: Text(
                    'John Doe',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ), // User's name
                  subtitle: Text(
                    'john.doe@example.com',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ), // User's email
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Edit profile button
            ElevatedButton(
              onPressed: () {
                // Navigate to edit profile page
                // Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfilePage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Change password button
            ElevatedButton(
              onPressed: () {
                // Navigate to change password page
                // Navigator.push(context, MaterialPageRoute(builder: (_) => ChangePasswordPage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Change Password',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Activity history section
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Activity History',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Add activity history items here
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Settings button
            ElevatedButton(
              onPressed: () {
                // Navigate to settings page
                // Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsPage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Logout button
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page and remove all the routes from the stack
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => LoginPage()),
                      (Route<dynamic> route) => false, // Remove all routes in the stack
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

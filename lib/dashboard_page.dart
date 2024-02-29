import 'package:flutter/material.dart';
import 'create_receipt_page.dart';
import 'create_donor_page.dart';
import 'donor_list_page.dart';
import 'receipt_list_page.dart';
import 'profile_page.dart'; // Import your profile page here

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardContent(),
    ReceiptListPage(),
    DonorListPage(),
    ProfilePage(), // Include ProfilePage as one of the options
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove the app bar
      drawer: buildDrawer(context),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Receipts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Donors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF940B92), // Dark purple color for selected item
        unselectedItemColor: Color(0xFFAC87C5), // Light purple color for unselected items
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          buildDrawerItem(context, 'Donors', [
            'Donor List',
            'Create Donor',
          ]),
          buildDrawerItem(context, 'Receipts', [
            'Receipt List',
            'Create Receipt',
          ]),
        ],
      ),
    );
  }

  Widget buildDrawerItem(BuildContext context, String title, List<String> options) {
    return Container(
      color: title == 'Donors' || title == 'Receipts' ? Color(0xFF756AB6) : null,
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: title == 'Donors' || title == 'Receipts' ? Color(0xFFAC87C5) : null,
        children: options.map((option) {
          return Container(
            color: Color(0xFFE0AED0),
            child: ListTile(
              title: Text(
                option,
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
                if (option == 'Create Receipt') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateReceiptPage()),
                  );
                } else if (option == 'Create Donor') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateDonorPage()),
                  );
                } else if (option == 'Donor List') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonorListPage()),
                  );
                } else if (option == 'Receipt List') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReceiptListPage()),
                  );
                } else {
                  // Handle other options if needed
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: Color(0xFFDCBFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateReceiptPage()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.purple[400],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Create Receipt',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateDonorPage()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.purple[400],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Create Donor',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

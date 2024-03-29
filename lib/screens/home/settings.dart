import 'package:flutter/material.dart';



class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'General Settings',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            ListTile(
              title: Text('Notifications'),
              trailing: Switch(
                value: true, // Replace with actual value from user preferences
                onChanged: (bool newValue) {
                  // Add logic to handle user's notification preference
                },
              ),
            ),
            ListTile(
              title: Text('Language'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Add logic to navigate to language selection screen
              },
            ),
            Divider(),
            Text(
              'E-commerce Settings',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            ListTile(
              title: Text('Payment Methods'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Add logic to navigate to payment methods screen
              },
            ),
            ListTile(
              title: Text('Shipping Address'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Add logic to navigate to shipping address screen
              },
            ),
            Divider(),
            Text(
              'Weather Forecast Settings',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            ListTile(
              title: Text('Location'),
              subtitle: Text('Current Location'), // Replace with actual location
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Add logic to update user's location
              },
            ),
            Divider(),
            Text(
              'Crop Examination Settings',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            ListTile(
              title: Text('Select Crop'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Add logic to navigate to crop selection screen
              },
            ),
            ListTile(
              title: Text('Examine Crop'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Add logic to navigate to crop examination screen
              },
            ),
          ],
        ),
      ),
    );
  }
}


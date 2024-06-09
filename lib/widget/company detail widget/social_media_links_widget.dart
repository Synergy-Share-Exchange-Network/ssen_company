import 'package:flutter/material.dart';

class SocialMediaFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Contact Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Address: 123 Flutter Street, Dart City, FL'),
          SizedBox(height: 8),
          Text('Phone: (123) 456-7890'),
          SizedBox(height: 8),
          Text('Email: info@example.com'),
          SizedBox(height: 16),
          Divider(),
          Text(
            'Follow Us',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.facebook),
                onPressed: () {
                  // Add your Facebook link here
                },
              ),
              IconButton(
                icon: Icon(Icons.facebook),
                onPressed: () {
                  // Add your Twitter link here
                },
              ),
              IconButton(
                icon: Icon(Icons.facebook),
                onPressed: () {
                  // Add your Instagram link here
                },
              ),
              IconButton(
                icon: Icon(Icons.facebook),
                onPressed: () {
                  // Add your LinkedIn link here
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Divider(),
          GestureDetector(
            onTap: () {
              // Navigate to Terms and Conditions
            },
            child: Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ssen_company/Models/company_profile_model.dart';

class SocialMediaFooter extends StatelessWidget {
  final CompanyProfileModel company;

  const SocialMediaFooter({Key? key, required this.company}) : super(key: key);
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
          Text('Address: ${company.locationDescription}'),
          SizedBox(height: 8),
          Text('Phone: ${company.phoneNumber}'),
          SizedBox(height: 8),
          Text('Email: ${company.email}'),
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
          // Divider(),
          // GestureDetector(
          //   onTap: () {
          //     // Navigate to Terms and Conditions
          //   },
          //   child: Text(
          //     'Terms and Conditions',
          //     style: TextStyle(
          //       fontSize: 16,
          //       color: Colors.blue,
          //       decoration: TextDecoration.underline,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

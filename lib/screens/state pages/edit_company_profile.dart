import 'package:flutter/material.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit_basic_profile.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit_detail_profile.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit_image_profile.dart';

class EditCompanyProfile extends StatelessWidget {
  const EditCompanyProfile({super.key});
  static const route = "edit_company_profile";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Edit Profile',
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.blue,
                // fontSize: 27,
                fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(labelColor: Colors.blue, tabs: [
            Tab(
              text: "Basic",
            ),
            Tab(
              text: "Image",
            ),
            Tab(
              text: "Detail",
            ),
          ]),
        ),
        body: TabBarView(children: [
          EditBasicCompanyProfile(),
          EditImageCompanyProfile(),
          EditDetailCompanyProfile()
        ]),
      ),
    );
  }
}

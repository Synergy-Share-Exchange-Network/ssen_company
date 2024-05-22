import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_key_figure.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_testimonial.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_why_invest.dart';

class EditDetailCompanyProfile extends StatelessWidget {
  const EditDetailCompanyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomListTile(
              title: 'Why Invest',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditWhyInvest(why_invest: []),
                  ),
                );
              }),
          CustomListTile(
              title: 'Product',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditWhyInvest(why_invest: []),
                  ),
                );
              }),
          CustomListTile(title: 'Service', onTap: () {}),
          CustomListTile(
              title: 'Key Figure',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditKeyFigure(keyFigure: []),
                  ),
                );
              }),
          CustomListTile(
              title: 'Testimonial',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditTestimonial(testmonyies: []),
                  ),
                );
              }),
          CustomListTile(title: 'Partners', onTap: () {}),
          CustomListTile(title: 'FAQ', onTap: () {}),
          CustomListTile(title: 'Terms & Conditions', onTap: () {}),
          CustomListTile(title: 'Awards & Recognition', onTap: () {}),
          CustomListTile(title: 'Social Media Links', onTap: () {}),
          CustomListTile(title: 'Bank Account', onTap: () {}),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}

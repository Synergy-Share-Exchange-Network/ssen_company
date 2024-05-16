import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


import '../widget/setting_elements_widget.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);
  static const route = "Setting";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
         
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SettingElementsWidget(
                description: 'Frequently Asked Questions',
                icon: Icons.question_mark_outlined,
                name: 'FAQs',
                // function: () {
                //   print("go to faq");
                // },
              ),
              SettingElementsWidget(
                description: 'terms of use, terms of service, or user agreements',
                icon: Icons.format_align_justify,
                name: 'Term And Condition',
                // function: () {
                //   print("go to term and condition");
                // },
              ),
              SettingElementsWidget(
                description: 'description about the system',
                icon: Icons.info,
                name: 'About',
                // function: () {
                //   print("go to faq");
                // },
              ),
              SettingElementsWidget(
                description: 'a set of predefined styles ',
                icon: Icons.palette,
                name: 'Themes',
                // function: () {
                //   print("go to faq");
                // },
              ),
              SettingElementsWidget(
                description:
                    'retrieving the latest versions of software updates ',
                icon: Icons.update,
                name: 'Check for update',
                // function: () {
                //   print("go to faq");
                // },
              ),
              SettingElementsWidget(
                description: 'terminating the users current session ',
                icon: Icons.logout,
                name: 'Log out',
                // function: () {
                //   print("go to faq");
                // },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

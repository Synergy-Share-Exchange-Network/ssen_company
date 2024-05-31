import 'package:flutter/material.dart';
import 'package:ssen_company/screens/components/announcement.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit_basic_profile.dart';
import 'package:ssen_company/screens/state%20pages/edit_company_profile.dart';
import 'package:ssen_company/utils/constants/colors.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants.dart';
import '../../utils/helper_function.dart';

import '../components/analysis.dart';
import '../components/company_profile_home.dart';
import '../components/company_profile_news.dart';
import '../components/company_profile_overview.dart';
import '../components/components/company_profile_home.dart';
import '../components/components/company_profile_news.dart';
import '../components/components/company_profile_overview.dart';

class Companyprofile extends StatelessWidget {
  static const route = "company_profile";
  const Companyprofile({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              dark ? SColors.darkContainer : SColors.lightContainer,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Habesha Beer',
            style: dark
                ? STextTheme.darkTextTheme.headlineSmall
                : STextTheme.lightTextTheme.headlineSmall,
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditCompanyProfile()), // Replace ShareholderDetailPage() with your actual detail page
                  );
                },
                child: Text('Edit Profile'))
          ],
          bottom: TabBar(
              labelColor: dark ? SColors.lighGrey : SColors.darkContainer,
              tabs: [
                Tab(
                  child: Text(
                    "Home",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
                Tab(
                  child: Text(
                    "overview",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
                Tab(
                  child: Text(
                    "News",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
              ]),
        ),
        body: Padding(
          padding: (MediaQuery.of(context).size.width > phoneSize)
              ? EdgeInsets.symmetric(horizontal: 50)
              : EdgeInsets.symmetric(horizontal: 0),
          child: (TabBarView(children: [
            CompanyHome(),
            Anlaytics(),
            Announcment(),
          ])),
        ),
      ),
    );
  }
}

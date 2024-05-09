import 'package:flutter/material.dart';
import 'package:ssen_company/utils/constants/colors.dart';



import '../../services/theme/text_theme.dart';
import '../../utils/helper_function.dart';

import '../components/company_profile_home.dart';
import '../components/company_profile_news.dart';
import '../components/company_profile_overview.dart';
import '../partial screen/edit_main_profile.dart';

class Companyprofile extends StatelessWidget {
  const Companyprofile({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
       
           backgroundColor: dark ? SColors.darkContainer : SColors.lightContainer,
          elevation: 0,
          centerTitle: true,
         title: Text(
          'Habesha Beer',
          style: dark
              ? STextTheme.darkTextTheme.headlineSmall
              : STextTheme.lightTextTheme.headlineSmall,
        ),
          actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(onPressed: (){  Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  EditProfile()), // Replace ShareholderDetailPage() with your actual detail page
        );}, child:   Text('Edit Profile')),
          )
          ],
          bottom:  TabBar(
            labelColor: dark ? SColors.lighGrey : SColors.darkContainer,
          
          
           tabs: [
            Tab(
             child: Text(
        "Home",
        style: TextStyle(fontWeight: FontWeight.bold), // Make text bold
      ),
              
            ),
            Tab(
              child: Text(
        "overview",
        style: TextStyle(fontWeight: FontWeight.bold), // Make text bold
      ),
            ),
            Tab(
             child: Text(
        "News",
        style: TextStyle(fontWeight: FontWeight.bold), // Make text bold
      ),
            ),
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150),
          child: (const TabBarView(children: [
            CompanyHome(),
            CompanyOverview(),
            CompanyNews(),
          ])),
        ),
       
      ),
    );
  }
}

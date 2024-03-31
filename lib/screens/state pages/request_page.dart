import 'package:flutter/material.dart';
import 'package:ssen_company/utils/constants/colors.dart';



import '../../services/theme/text_theme.dart';
import '../../utils/helper_function.dart';

import '../components/company_profile_home.dart';
import '../components/company_profile_news.dart';
import '../components/company_profile_overview.dart';
import '../partial screen/edit_main_profile.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
       
          backgroundColor: dark ? SColors.darkContainer : SColors.lightContainer,
          elevation: 0,
           title: Text(
          'Analaytics',
          style: dark
              ? STextTheme.darkTextTheme.headlineSmall
              : STextTheme.lightTextTheme.headlineSmall,
        ),
        centerTitle: true,
         
          bottom:  TabBar(
            labelColor: dark?SColors.white:SColors.black,
          
          
           tabs: const[
            Tab(
             child: Text(
        "Primary",
        style: TextStyle(fontWeight: FontWeight.bold), // Make text bold
      ),
              
            ),
            Tab(
              child: Text(
        "Secondary",
        style: TextStyle(fontWeight: FontWeight.bold), // Make text bold
      ),
            ),
            
          ]),
        ),
        body: (const TabBarView(children: [
          
          CompanyOverview(),
          CompanyNews(),
        ])),
       
      ),
    );
  }
}

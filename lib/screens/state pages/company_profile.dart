import 'package:flutter/material.dart';



import '../../utils/helper_function.dart';
import '../components/company_profile_home.dart';
import '../components/company_profile_news.dart';
import '../components/company_profile_overview.dart';

class Companyprofile extends StatelessWidget {
  const Companyprofile({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
       
          backgroundColor: dark ? Colors.black : Colors.white,
          elevation: 0,
          title: Text(
            'Habesha Beer',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
          SizedBox(
            height: 5,
           
            child: ElevatedButton(onPressed: (){}, child:   Text('Edit Profile'))
          ,)
          ],
          bottom: const TabBar(labelColor: Colors.blue,
          
          
           tabs: [
            Tab(
              text: "Home" ,
              
              
            ),
            Tab(
              text: "Overview",
            ),
            Tab(
              text: "News",
            ),
          ]),
        ),
        body: (const TabBarView(children: [
          CompanyHome(),
          CompanyOverview(),
          CompanyNews(),
        ])),
      ),
    );
  }
}

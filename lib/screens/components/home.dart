import 'package:flutter/material.dart';
import 'package:ssen_company/screens/components/announcement.dart';
import 'package:ssen_company/utils/constants/colors.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants.dart';
import '../../utils/constants/navbar.dart';
import '../../utils/helper_function.dart';

import '../../widget/request_widget.dart';
import '../../widget/secondary_request_widget.dart';
import '../components/company_profile_home.dart';
import '../components/company_profile_news.dart';
import '../components/company_profile_overview.dart';
import '../share.dart';
import '../share_page.dart';
import '../state pages/company_profile.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer:
            (MediaQuery.of(context).size.width > phoneSize) ? null : NavBar(),
        appBar: (MediaQuery.of(context).size.width > phoneSize)
            ? AppBar(
                // automaticallyImplyLeading: false,
                backgroundColor:
                    dark ? SColors.darkContainer : SColors.lightContainer,
                bottom: TabBar(
                    labelColor: dark ? SColors.white : SColors.black,
                    tabs: const [
                      Tab(
                        child: Text(
                          "Share",
                          style: TextStyle(
                              fontWeight: FontWeight.bold), // Make text bold
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Announcement",
                          style: TextStyle(
                              fontWeight: FontWeight.bold), // Make text bold
                        ),
                      ),
                    ]),
              )
            : AppBar(
                // automaticallyImplyLeading: false,
                actions: [
                  // Icon(Iconsax.notification),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // Icon(Iconsax.search_normal),

                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Companyprofile.route);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 1),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("company.logoImage[0]"))),
                    ),
                  ),
                ],
                backgroundColor:
                    dark ? SColors.darkContainer : SColors.lightContainer,
                bottom: TabBar(
                    labelColor: dark ? SColors.white : SColors.black,
                    tabs: const [
                      Tab(
                        child: Text(
                          "Share",
                          style: TextStyle(
                              fontWeight: FontWeight.bold), // Make text bold
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Announcement",
                          style: TextStyle(
                              fontWeight: FontWeight.bold), // Make text bold
                        ),
                      ),
                    ]),
              ),
        body: (TabBarView(children: [
          SharePage(),
          Announcment(),
        ])),
      ),
    );
  }
}

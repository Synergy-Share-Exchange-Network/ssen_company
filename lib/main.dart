import 'package:flutter/material.dart';
import 'package:ssen_company/custom_responsive.dart';
import 'package:ssen_company/responsive.dart';
import 'package:ssen_company/screens/desktop_responsive.dart';
import 'package:ssen_company/screens/login.dart';
import 'package:ssen_company/screens/partial%20screen/edit_main_profile.dart';
import 'package:ssen_company/screens/partial%20screen/edit_share.dart';
import 'package:ssen_company/screens/setting.dart';
import 'package:ssen_company/screens/state%20pages/company_profile.dart';

import 'package:ssen_company/screens/state%20pages/main_page.dart';
import 'package:ssen_company/screens/shareholder_detail_page.dart';
import 'package:ssen_company/screens/subscriber_detail_page.dart';
import 'package:ssen_company/services/app_routes.dart';
import 'package:ssen_company/services/theme/app_theme.dart';
import 'package:ssen_company/widget/company%20detail/bank_account.dart';
import 'package:ssen_company/widget/edit%20profile/edit_testimonial.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Synegy Share Exchange Network',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: SappTheme.lightTheme,
      darkTheme: SappTheme.darkTheme,
      // home: AddPost(),
      // home: Anlaytics(),
      // home: EditProfile(),
      // home: MainPage(),
      // home: CustomDesktopResponsive(indexfromCall: 0, widget: null,),
      // home:const DesktopResponsive(indexfromCall: 0),
      // home: SubscriberDetailPage(),
      // home: verticlScrollableBankAccount(),
      // home: EditAddTestimonial(),
      // home: Companyprofile(),
      // home:  EditTestimonial(title: 'testimonial',),
      // home: ShareHolderProfile(),
      // home: AnnouncementPage(),
      // home: Product(),
      // home: PostDetail(),
      home: Responsive(),
      // home: Setting(),
      // home: EditShare(),

      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}

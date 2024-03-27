import 'package:flutter/material.dart';
import 'package:ssen_company/screens/partial%20screen/edit_main_profile.dart';
import 'package:ssen_company/screens/state%20pages/company_profile.dart';

import 'package:ssen_company/screens/state%20pages/main_page.dart';
import 'package:ssen_company/screens/state%20pages/shareholder_detail_page.dart';
import 'package:ssen_company/services/app_routes.dart';
import 'package:ssen_company/services/theme/app_theme.dart';
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
      title: 'Synergy Share Exchange Network',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: SappTheme.lightTheme,
      darkTheme: SappTheme.darkTheme,
      // home: AddPost(),
      // home: Anlaytics(),
      // home: EditProfile(),
      home: MainPage(),
      // home: Companyprofile(),
    // home:  EditTestimonial(title: 'testimonial',),
      // home: ShareHolderProfile(),
      // home: AnnouncementPage(),
      // home: Product(),
      // home: PostDetail(),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}

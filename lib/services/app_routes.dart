import 'package:flutter/material.dart';


import '../screens/about.dart';
import '../screens/setting.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case EnterNewPassword.route:
      //   return MaterialPageRoute(builder: (_) => const EnterNewPassword());
      // case ConfirmAccount.route:
      //   return MaterialPageRoute(builder: (_) => const ConfirmAccount());
      // case TermAndCondition.route:
      //   return MaterialPageRoute(builder: (_) => const TermAndCondition());
      // case EnterNewEmail.route:
      //   return MaterialPageRoute(builder: (_) => const EnterNewEmail());
      // case About.route:
      //   return MaterialPageRoute(builder: (_) => const About());
      // case Setting.route:
      //   return MaterialPageRoute(builder: (_) => const Setting());
      // case ConfirmAccountChangeEmail.route:
      //   return MaterialPageRoute(
      //       builder: (_) => const ConfirmAccountChangeEmail());
      default:
        return null;
    }
  }
}

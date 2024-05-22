import 'package:flutter/material.dart';
import 'package:ssen_company/intermediate.dart';
import 'package:ssen_company/responsive.dart';
import 'package:ssen_company/screens/pending_request.dart';
import 'package:ssen_company/screens/state%20pages/main_page.dart';

import '../screens/about.dart';
import '../screens/login.dart';
import '../screens/setting.dart';
import '../screens/signup.dart';

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

      case Intermediate.route:
        return MaterialPageRoute(builder: (_) => const Intermediate());
      case Responsive.route:
        return MaterialPageRoute(builder: (_) => const Responsive());
      case SignUp.route:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case Login.route:
        return MaterialPageRoute(builder: (_) => const Login());
      case MainPage.route:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case PendingRequest.route:
        return MaterialPageRoute(builder: (_) => const PendingRequest());
      // case Editw.route:
      //   return MaterialPageRoute(builder: (_) => const PendingRequest());
      default:
        return null;
    }
  }
}

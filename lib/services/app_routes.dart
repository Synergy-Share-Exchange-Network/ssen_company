import 'package:flutter/material.dart';
import 'package:ssen_company/intermediate.dart';
import 'package:ssen_company/responsive.dart';
import 'package:ssen_company/screens/pending_request.dart';
import 'package:ssen_company/screens/state%20pages/main_page.dart';

import '../screens/about.dart';
import '../screens/login.dart';
import '../screens/setting.dart';
import '../screens/signup.dart';
import '../screens/state pages/edit_company_profile.dart';
import '../screens/terms and condition.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case EnterNewPassword.route:
      //   return MaterialPageRoute(builder: (_) => const EnterNewPassword());
      // case ConfirmAccount.route:
      //   return MaterialPageRoute(builder: (_) => const ConfirmAccount());
      case TermsAndConditionsPage.route:
        return MaterialPageRoute(builder: (_) => TermsAndConditionsPage());
      // case EnterNewEmail.route:
      //   return MaterialPageRoute(builder: (_) => const EnterNewEmail());
      case AboutUs.route:
        return MaterialPageRoute(builder: (_) => AboutUs());
      case Setting.route:
        return MaterialPageRoute(builder: (_) => const Setting());
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
      case EditCompanyProfile.route:
        return MaterialPageRoute(builder: (_) => const EditCompanyProfile());
      // case Editw.route:
      //   return MaterialPageRoute(builder: (_) => const PendingRequest());
      default:
        return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:ssen_company/screens/partial%20screen/process%20requests/Payment_pending_request.dart';
import 'package:ssen_company/screens/partial%20screen/process%20requests/payment_verified.dart';
import 'package:ssen_company/screens/partial%20screen/process%20requests/request_history.dart';
import 'package:ssen_company/screens/pending_request.dart';
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

class ProcessPage extends StatelessWidget {
  const ProcessPage({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer:
            (MediaQuery.of(context).size.width > phoneSize) ? null : NavBar(),
        appBar: AppBar(
          backgroundColor:
              dark ? SColors.darkContainer : SColors.lightContainer,
          elevation: 0,
          title: Text(
            'Request',
            style: dark
                ? STextTheme.darkTextTheme.headlineSmall
                : STextTheme.lightTextTheme.headlineSmall,
          ),
          centerTitle: true,
          bottom: TabBar(
              labelColor: dark ? SColors.white : SColors.black,
              tabs: const [
                Tab(
                  child: Text(
                    "Pending ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
                Tab(
                  child: Text(
                    "Payment verifiyed ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
                Tab(
                  child: Text(
                    "History",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
              ]),
        ),
        body: (TabBarView(children: [
          PaymentPendingRequest(),
          PaymentVerified(),
          RequestHistory()
        ])),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/Models/user_model.dart';
import 'package:ssen_company/provider/company_provider.dart';
import 'package:ssen_company/screens/desktop_responsive.dart';
import 'package:ssen_company/screens/pending_request.dart';
import 'package:ssen_company/screens/state%20pages/main_page.dart';
import 'package:ssen_company/utils/constants.dart';

class Intermediate extends StatefulWidget {
  const Intermediate({super.key});
  static const route = "intermediate";

  @override
  State<Intermediate> createState() => _IntermediateState();
}

class _IntermediateState extends State<Intermediate> {
  @override
  Widget build(BuildContext context) {
    CompanyProfileModel company = Provider.of<UserProvider>(context).getCompany;

    return Scaffold(
        body: (company.isVerified)
            ? (MediaQuery.of(context).size.width > phoneSize)
                ? const DesktopResponsive(
                    indexfromCall: 0,
                  )
                : const MainPage()
            : PendingRequest()
        // body: ElevatedButton(
        //     onPressed: () {
        //       print(company.toString());
        //     },
        //     child: Text("   OKAY  ")),
        );
  }
}

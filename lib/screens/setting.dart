import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/Models/company_requirement_on_secondry_market_model.dart';
import 'package:ssen_company/provider/company_provider.dart';
import 'package:ssen_company/repository/firebase/model%20methods/firebase_company_requirements_methods.dart';
import 'package:ssen_company/screens/secondary_post_requirment.dart';

import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';
import '../widget/setting_elements_widget.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);
  static const route = "Setting";

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    double width = MediaQuery.of(context).size.width;
    CompanyProfileModel? company =
        Provider.of<UserProvider>(context).getCompany;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Setting',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: dark ? SColors.darkContainer : SColors.lightContainer,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          constraints:
              BoxConstraints(maxWidth: width > 800 ? 800 : width * 0.9),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SettingElementsWidget(
                  description: 'requirement on secondary market',
                  icon: Icons.assignment,
                  name: 'Secondary Requirement',
                  function: () async {
                    CompanyRequirementOnSecondryMarketModel comReq;

                    // try {
                    //   comReq =await FirebaseCompanyRequirementsMethods().read(id);
                    // } catch (e) {
                    //   comReq =Com
                    // }
                    if (company.userRequirment == "") {
                      comReq = CompanyRequirementOnSecondryMarketModel();
                    } else {
                      comReq = await FirebaseCompanyRequirementsMethods()
                          .read(company.userRequirment);
                    }
                    // print("object");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondaryPostRequirment(
                                comReq: comReq,
                              )),
                    );
                  },
                ),
                SettingElementsWidget(
                  description: 'Frequentlys',
                  icon: Icons.question_mark_outlined,
                  name: 'FAQs', function: () {},
                  // function: () {
                  //   print("go to faq");
                  // },
                ),
                SettingElementsWidget(
                  description: 'terms of use,',
                  icon: Icons.format_align_justify,
                  name: 'Term And Condition', function: () {},
                  // function: () {
                  //   print("go to term and condition");
                  // },
                ),
                SettingElementsWidget(
                  description: 'description',
                  icon: Icons.info,
                  name: 'About', function: () {},
                  // function: () {
                  //   print("go to faq");
                  // },
                ),
                SettingElementsWidget(
                  description: 'a set  ',
                  icon: Icons.palette,
                  name: 'Themes', function: () {},
                  // function: () {
                  //   print("go to faq");
                  // },
                ),
                SettingElementsWidget(
                  description: 'retrieving the ',
                  icon: Icons.update,
                  name: 'Check for update', function: () {},
                  // function: () {
                  //   print("go to faq");
                  // },
                ),
                SettingElementsWidget(
                  description: 'terminating  ',
                  icon: Icons.logout,
                  name: 'Log out', function: () {},
                  // function: () {
                  //   print("go to faq");
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

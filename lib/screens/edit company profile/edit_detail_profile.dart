import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/key_figure_model.dart';
import 'package:ssen_company/repository/firebase/model%20methods/firebase_key_figure_methods.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_award_and_recognition.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_bank_account.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_faq.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_key_figure.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_partners.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_product.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_service.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_social_media_link.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_testimonial.dart';
import 'package:ssen_company/screens/edit%20company%20profile/edit%20components/edit_why_invest.dart';

import '../../Models/company_profile_model.dart';
import '../../provider/company_provider.dart';
import '../partial screen/edit company detail/add_service.dart';

class EditDetailCompanyProfile extends StatelessWidget {
  const EditDetailCompanyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CompanyProfileModel company = Provider.of<UserProvider>(context).getCompany;

    return Scaffold(
      body: ListView(
        children: [
          CustomListTile(
              title: 'Why Invest',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditWhyInvest(why_invest: []),
                  ),
                );
              }),
          CustomListTile(
              title: 'Product',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditProduct(product: []),
                  ),
                );
              }),
          CustomListTile(
              title: 'Service',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditService(
                      service: [],
                      product: [],
                    ),
                  ),
                );
              }),
          CustomListTile(
              title: 'Key Figure',
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    content: Container(
                      padding: EdgeInsets.all(20),
                      height: 125,
                      child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Loading..."),
                        ],
                      ),
                    ),
                  ),
                );
                List<KeyFigureModel> listKeyFigure = [];
                for (var element in company.keyFigureID) {
                  KeyFigureModel x =
                      await FirebaseKeyFigureMethods().read(element);
                  // print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
                  // print(x);

                  listKeyFigure.add(x);
                }
                // print(listKeyFigure);
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        EditKeyFigure(keyFigure: listKeyFigure),
                  ),
                );
              }),
          CustomListTile(
              title: 'Testimonial',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditTestimonial(testmonyies: []),
                  ),
                );
              }),
          CustomListTile(
              title: 'Partners',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditPartners(partners: []),
                  ),
                );
              }),
          CustomListTile(
              title: 'FAQ',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditFAQ(faq: []),
                  ),
                );
              }),
          CustomListTile(title: 'Terms & Conditions', onTap: () {}),
          CustomListTile(
              title: 'Awards & Recognition',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => EditAwardAndRecognition(
                            awardAndRecognition: [],
                          )),
                );
              }),
          CustomListTile(
              title: 'Social Media Links',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => EditSocialMediaLink(
                            socialMediaLink: [],
                          )),
                );
              }),
          CustomListTile(
              title: 'Bank Account',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => EditBankAccount(
                            bankAccount: [],
                          )),
                );
              }),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}

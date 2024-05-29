import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/faq_model.dart';
import 'package:ssen_company/Models/key_figure_model.dart';
import 'package:ssen_company/Models/product_and_service_model.dart';
import 'package:ssen_company/Models/testimonial_model.dart';
import 'package:ssen_company/Models/why_invest.dart';
import 'package:ssen_company/repository/firebase/model%20methods/firebase_faq_methods.dart';
import 'package:ssen_company/repository/firebase/model%20methods/firebase_key_figure_methods.dart';
import 'package:ssen_company/repository/firebase/model%20methods/firebase_testimonial_methods.dart';
import 'package:ssen_company/repository/firebase/model%20methods/firebase_why_invest_methods.dart';
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
                List<WhyInvestModel> listwhyinvest = [];
                for (var element in company.whyInvestID) {
                  WhyInvestModel x =
                      await FirebasewhyInvestMethod().read(element);
                  // print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
                  // print(x);

                  listwhyinvest.add(x);
                }
                // print(listKeyFigure);
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        EditWhyInvest(why_invest: listwhyinvest),
                  ),
                );
              }),
          CustomListTile(
              title: 'Product',
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
                List<ProductModel> listproducts = [];
                for (var element in company.productID) {
                  print(listproducts);
                  // ProductModel product =
                  // await firebasep().read(element);
                  // print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
                  // print(x);

                  // listproducts.add(product);
                }
                // print(listKeyFigure);
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => EditProduct(product: listproducts)),
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
                List<TestimonialModel> listTestimonial = [];
                for (var element in company.testimonialID) {
                  TestimonialModel testimonial =
                      await FirebaseTestimonialMethods().read(element);
                  // print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
                  // print(x);

                  listTestimonial.add(testimonial);
                }
                // print(listKeyFigure);
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        EditTestimonial(testimonial: listTestimonial),
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
                List<FaqModel> listFaq = [];
                for (var element in company.faqID) {
                  FaqModel faq = await FirebaseFaqMethod().read(element);
                  // print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
                  // print(x);

                  listFaq.add(faq);
                }
                // print(listKeyFigure);
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditFAQ(faq: listFaq),
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
                  MaterialPageRoute(builder: (context) => EditBankAccount()),
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

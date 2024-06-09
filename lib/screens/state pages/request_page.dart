import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/provider/company_provider.dart';
import 'package:ssen_company/utils/constants/colors.dart';

import '../../Models/purchase_model.dart';
import '../../Repository/firebase/key words/collection_name.dart';
import '../../services/theme/text_theme.dart';
import '../../utils/constants.dart';
import '../../utils/constants/navbar.dart';
import '../../utils/helper_function.dart';

import '../../widget/request_widget.dart';
import '../../widget/secondary_request_widget.dart';
import '../components/company_profile_home.dart';
import '../components/company_profile_news.dart';
import '../components/company_profile_overview.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    CompanyProfileModel? company =
        Provider.of<UserProvider>(context).getCompany;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer:
            (MediaQuery.of(context).size.width > phoneSize) ? null : NavBar(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:
              dark ? SColors.darkContainer : SColors.lightContainer,
          elevation: 0,
          // title: Text(
          //   'Request',
          //   style: dark
          //       ? STextTheme.darkTextTheme.headlineSmall
          //       : STextTheme.lightTextTheme.headlineSmall,
          // ),
          centerTitle: true,
          bottom: TabBar(
              labelColor: dark ? SColors.white : SColors.black,
              tabs: const [
                Tab(
                  child: Text(
                    "Primary",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
                Tab(
                  child: Text(
                    "Secondary",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
              ]),
        ),
        body: (TabBarView(children: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(CollectionName.purchase)
                  .orderBy('date', descending: true)
                  .where('companyID', isEqualTo: company.identification)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                List<PurchaseModel> purchases =
                    snapshot.data!.docs.map((document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return PurchaseModel.fromMap(data);
                }).toList();
                List<PurchaseModel> pendingRequest = [];
                List<PurchaseModel> waitingVerifyUser = [];
                List<PurchaseModel> waitingpayment = [];
                List<PurchaseModel> historyPurchase = [];
                for (var purchase in purchases) {
                  if (purchase.successfullyBought.isEmpty) {
                    if (purchase.acceptedPayment.isNotEmpty) {
                      if (purchase.acceptedPayment[0] == 'false') {
                        historyPurchase.add(purchase);
                      } else {
                        waitingVerifyUser.add(purchase);
                      }
                    } else if (purchase.requestAccepted.isNotEmpty) {
                      if (purchase.requestAccepted[0] == 'false') {
                        historyPurchase.add(purchase);
                      } else {
                        waitingpayment.add(purchase);
                      }
                    } else if (purchase.requestSent.isNotEmpty) {
                      if (purchase.requestSent[0] == 'false') {
                        historyPurchase.add(purchase);
                      } else {
                        pendingRequest.add(purchase);
                      }
                    }
                  }
                }
                return SingleChildScrollView(
                  child: (pendingRequest.isEmpty)
                      ? const Center(
                          child: Text("No Data"),
                        )
                      : Column(
                          children: pendingRequest.map((purchase) {
                            return RequestWidget(
                              purchase: purchase,
                            );
                          }).toList(),
                        ),
                );
              }),
          SingleChildScrollView(
            child: Column(
              children: [
                SecondaryRequestWidget(),
                // Text('yes')
              ],
            ),
          ),
        ])),
      ),
    );
  }
}

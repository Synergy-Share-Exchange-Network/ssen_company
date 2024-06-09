import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/Models/purchase_model.dart';
import 'package:ssen_company/Repository/firebase/key%20words/collection_name.dart';
import 'package:ssen_company/provider/company_provider.dart';
import 'package:ssen_company/screens/partial%20screen/process%20requests/Payment_pending_request.dart';
import 'package:ssen_company/screens/partial%20screen/process%20requests/payment_verified.dart';
import 'package:ssen_company/screens/partial%20screen/process%20requests/request_history.dart';
import 'package:ssen_company/screens/pending_request.dart';
import 'package:ssen_company/utils/constants/colors.dart';
import 'package:ssen_company/widget/payment_pending_request_widget.dart';
import 'package:ssen_company/widget/payment_verified_widget.dart';
import 'package:ssen_company/widget/request_history_widget.dart';

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
    CompanyProfileModel? company =
        Provider.of<UserProvider>(context).getCompany;
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
        body: StreamBuilder<QuerySnapshot>(
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
              // print("bbbbbbbbbbbbbbbbbbbbb");
              // print(company.identification);
              // print(purchases);
              // print("bbbbbbbbbbbbbbb");

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
              return (TabBarView(children: [
                SingleChildScrollView(
                  child: (waitingpayment.isEmpty)
                      ? const Center(
                          child: Text("No Data"),
                        )
                      : Column(
                          children: waitingpayment.map((purchase) {
                            return PaymentPendingRequestWidget(
                              purchase: purchase,
                            );
                          }).toList(),
                        ),
                ),
                SingleChildScrollView(
                  child: (waitingVerifyUser.isEmpty)
                      ? const Center(
                          child: Text("No Data"),
                        )
                      : Column(
                          children: waitingVerifyUser.map((purchase) {
                            return PaymentVerifiedWidget(
                              purchase: purchase,
                            );
                          }).toList(),
                        ),
                ),
                SingleChildScrollView(
                  child: (historyPurchase.isEmpty)
                      ? const Center(
                          child: Text("No Data"),
                        )
                      : Column(
                          children: historyPurchase.map((purchase) {
                            return RequesHistorytWidget(
                              purchase: purchase,
                            );
                          }).toList(),
                        ),
                ),
                // PaymentVerified(),
                // RequestHistory()
              ]));
            }),
      ),
    );
  }
}

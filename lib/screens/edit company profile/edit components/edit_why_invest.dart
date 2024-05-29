import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/why_invest.dart';
import 'package:ssen_company/Repository/firebase/firebase_storage_methods.dart';
import 'package:ssen_company/Repository/firebase/model%20methods/firebase_why_invest_methods.dart';
import 'package:ssen_company/screens/partial%20screen/edit%20company%20detail/add_why_invest.dart';
import 'package:ssen_company/widget/company%20detail%20widget/why_do_you_invest_widget.dart';

import '../../../Models/company_profile_model.dart';
import '../../../provider/company_provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/utils.dart';

class EditWhyInvest extends StatelessWidget {
  const EditWhyInvest({super.key, required this.why_invest});
  static const route = "edit_why_invest";
  final List<WhyInvestModel> why_invest;

  @override
  Widget build(BuildContext context) {
    // CompanyProfileModel company = Provider.of<UserProvider>(context).getCompany;
    Uint8List? whyInvestImage;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                size: 20, color: Colors.blue)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Edit Why Invest',
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.blue,
            // fontSize: 27,
            // fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed: () async {
                  (MediaQuery.of(context).size.width > phoneSize)
                      ? showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                actions: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    width: (MediaQuery.of(context).size.width >
                                            phoneSize)
                                        ? MediaQuery.of(context).size.width -
                                            600
                                        : MediaQuery.of(context).size.width,
                                    height: (MediaQuery.of(context).size.width >
                                            phoneSize)
                                        ? MediaQuery.of(context).size.height -
                                            150
                                        : MediaQuery.of(context).size.height -
                                            100,
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Add Why Invest",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 18),
                                            ),
                                            IconButton(
                                                onPressed: () => Navigator.of(
                                                        context,
                                                        rootNavigator: true)
                                                    .pop(),
                                                icon: const Icon(
                                                  Icons.close,
                                                  color: Colors.red,
                                                ))
                                          ],
                                        ),
                                        const Expanded(
                                          child: AddWhyInvest(),
                                          // child: AddKeyFigure(),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddWhyInvest()));
                },
                child: Text("Add Why Invest")),
          )
        ],
      ),
      // body: SingleChildScrollView(
      //   child: Container(
      //     decoration: const BoxDecoration(),
      //     width: MediaQuery.of(context).size.width,
      //     child: Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      // EditBankPreviousWhyInvest(
      //   whyinvest: why_invest[0],
      // ),
      // EditBankPreviousWhyInvest(),
      // EditBankPreviousWhyInvest(),
      // EditBankPreviousWhyInvest(),

      // Your form fields for editing bank account details can go here
      // ],
      body: (why_invest != [])
          ? ListView.builder(
              itemCount: why_invest.length,
              itemBuilder: (context, index) {
                return EditBankPreviousWhyInvest(
                  whyinvest: why_invest[index],
                );
              },
            )
          : Center(
              child: Text("No Why invests set"),
            ),
    );
  }
}

class EditBankPreviousWhyInvest extends StatelessWidget {
  const EditBankPreviousWhyInvest({
    Key? key,
    required this.whyinvest,
  }) : super(key: key);
  final WhyInvestModel whyinvest;

  @override
  Widget build(BuildContext context) {
    // WhyInvestModel whyinvest = WhyInvestModel(
    //     title: "benifit",
    //     description:
    //         "who they are, whatrelationship you havewith them and howwill you reach them.(Customerrelationships,Customer segments,Channels)");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          WhyYouInvestWidget(whyinvest: whyinvest),
          Positioned(
            top: 15.0,
            right: 20.0,
            child: PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    title: Text('Edit'),
                    onTap: () {
                      // Handle Option 1
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: Text('Delete'),
                    onTap: () {
                      // Handle Option 2
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

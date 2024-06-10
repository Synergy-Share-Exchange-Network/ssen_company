import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_company/repository/firebase/service%20methods/firebase_purchase_service_method.dart';
import 'package:ssen_company/utils/pdf/app.dart';

import '../../services/theme/text_theme.dart';

import '../Models/purchase_model.dart';
import '../screens/request_detail.dart';
import '../utils/constants.dart';
import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class PaymentVerifiedWidget extends StatelessWidget {
  const PaymentVerifiedWidget({Key? key, required this.purchase})
      : super(key: key);
  final PurchaseModel purchase;
  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);

    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: dark ? SColors.darkContainer : SColors.lightContainer,
        border: Border.all(
          width: 1,
          color: dark ? Colors.black : Colors.white,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${purchase.firstName} ${purchase.lastName}",
                      style: dark
                          ? STextTheme.darkTextTheme.headlineSmall
                          : STextTheme.lightTextTheme.headlineSmall),
                  Row(
                    children: [
                      Text(
                        'Payed Amount :${purchase.numberOfShare * purchase.sharePerPrice + 5 / 100 * purchase.numberOfShare * purchase.sharePerPrice} Birr',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.money,
                            color: Colors.blue,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Credit By: ${purchase.firstName} ${purchase.lastName}",
                            style: dark
                                ? STextTheme.darkTextTheme.bodySmall
                                : STextTheme.lightTextTheme.bodySmall,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.date_range,
                            color: Colors.blue,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "transaction id :${purchase.acceptedPayment[2]}",
                            style: dark
                                ? STextTheme.darkTextTheme.bodySmall
                                : STextTheme.lightTextTheme.bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     "${purchase.date}",
          //     style: dark
          //         ? STextTheme.darkTextTheme.bodySmall
          //         : STextTheme.lightTextTheme.bodySmall,
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // print("3333333333333333");
                  // showDialog(
                  //   context: context,
                  //   builder: (ctx) => AlertDialog(
                  //     content: Container(
                  //       padding: EdgeInsets.all(20),
                  //       height: 125,
                  //       child: Column(
                  //         children: const [
                  //           CircularProgressIndicator(),
                  //           SizedBox(
                  //             height: 20,
                  //           ),
                  //           Text("Saving ..."),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // );
                  // FirebasePurchaseServiceMethod()
                  //     .finshPurchaseTranaction(purchase, true, '');

                  // // Handle the decline action here with the reason
                  // Navigator.of(context).pop();

                  // Handle accept action

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Pdf1(purchase: purchase)),
                  );
                },
                child: Text('Approve'),
              ),
              SizedBox(height: 10),
              MediaQuery.of(context).size.width > phoneSize
                  ? ElevatedButton(
                      onPressed: () {
                        TextEditingController reasonController =
                            TextEditingController();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Decline Reason'),
                              content: TextField(
                                controller: reasonController,
                                decoration:
                                    InputDecoration(hintText: "Enter reason"),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
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
                                              Text("Saving..."),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                    FirebasePurchaseServiceMethod()
                                        .finshPurchasePayment(
                                            purchase,
                                            'transaction',
                                            false,
                                            reasonController.text.trim());
                                    // Handle the decline action here with the reason
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text('Submit'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: Text('Decline'),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        TextEditingController reasonController =
                            TextEditingController();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Decline Reason'),
                              content: TextField(
                                controller: reasonController,
                                decoration:
                                    InputDecoration(hintText: "Enter reason"),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
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
                                              Text("Saving..."),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                    FirebasePurchaseServiceMethod()
                                        .finshPurchasePayment(
                                            purchase,
                                            'transaction',
                                            false,
                                            reasonController.text.trim());
                                    // Handle the decline action here with the reason
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text('Submit'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: Text(
                        'Decline',
                        style: TextStyle(fontSize: 5),
                      ),
                    )
            ],
          ),
        ],
      ),
    );
  }
}

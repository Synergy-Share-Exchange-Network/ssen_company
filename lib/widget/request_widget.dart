import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_company/repository/firebase/model%20methods/firebase_purchase_methods.dart';
import 'package:ssen_company/repository/firebase/service%20methods/firebase_purchase_service_method.dart';

import '../../services/theme/text_theme.dart';

import '../Models/purchase_model.dart';
import '../screens/request_detail.dart';
import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class RequestWidget extends StatelessWidget {
  const RequestWidget({Key? key, required this.purchase}) : super(key: key);
  final PurchaseModel purchase;

  @override
  Widget build(BuildContext context) {
    // PurchaseModel purchase = PurchaseModel(
    //     identification: "13",
    //     firstName: "Wubet ",
    //     lastName: "Ayalew",
    //     email: "WubetAyalew@gmail.com",
    //     nationality: "ethiopian",
    //     region: "oromia",
    //     subCity: "bishoftu",
    //     phoneNumber: "0967547632",
    //     sharePerPrice: 500.0,
    //     numberOfShare: 40.0,
    //     bankAccount: "1000006474537",
    //     savingAccountAmount: "566",
    //     signature: "13",
    //     shareID: "14",
    //     userID: "55",
    //     companyID: "66",
    //     payedamount: 300.0,
    //     date: '2023/12/10');

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
                        'No of Share : ${purchase.numberOfShare.toString()}',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
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
                            "${purchase.payedamount.toString()} Birr",
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
                            "${purchase.date}",
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
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
                            Text("Accepting Request..."),
                          ],
                        ),
                      ),
                    ),
                  );
                  // Handle accept action
                  await FirebasePurchaseServiceMethod()
                      .acceptOrDeclinePurchase(purchase, '', true);
                  Navigator.pop(context);
                },
                child: Text('Accept'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
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
                          decoration: InputDecoration(hintText: "Enter reason"),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
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
                                        Text("Declaing Request..."),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                              // Handle accept action
                              await FirebasePurchaseServiceMethod()
                                  .acceptOrDeclinePurchase(purchase,
                                      reasonController.text.trim(), false);
                              Navigator.pop(context);
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}

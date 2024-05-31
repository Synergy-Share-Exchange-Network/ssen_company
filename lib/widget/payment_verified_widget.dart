import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../services/theme/text_theme.dart';

import '../Models/purchase_model.dart';
import '../screens/request_detail.dart';
import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class PaymentVerifiedWidget extends StatelessWidget {
  const PaymentVerifiedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PurchaseModel purchase = PurchaseModel(
      identification: "13",
      firstName: "Wubet ",
      lastName: "Ayalew",
      email: "WubetAyalew@gmail.com",
      nationality: "ethiopian",
      region: "oromia",
      subCity: "bishoftu",
      phoneNumber: "0967547632",
      sharePerPrice: 500.0,
      numberOfShare: 40.0,
      bankAccount: "1000006474537",
      savingAccountAmount: "566",
      signature: "13",
      shareID: "14",
      userID: "55",
      companyID: "66",
      payedamount: 300.0,
      date: '2023/12/10',
    );

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
                        'Payed Amount :2000 Birr',
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
                            "Credit By: Dawit Nigus",
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
                            "transaction id :1000000000",
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${purchase.date}",
              style: dark
                  ? STextTheme.darkTextTheme.bodySmall
                  : STextTheme.lightTextTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

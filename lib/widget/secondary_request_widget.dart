import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_company/Models/secondry_post_share.dart';
import 'package:ssen_company/Models/user_model.dart';

import '../../services/theme/text_theme.dart';

import '../Models/purchase_model.dart';
import '../screens/request_detail.dart';
import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class SecondaryRequestWidget extends StatelessWidget {
  const SecondaryRequestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel User = UserModel(
        firstName: 'Robel', lastName: 'Issa', phoneNumber: '097299090');
    UserModel User2 = UserModel(
        firstName: 'Wubet', lastName: 'Ayalew', phoneNumber: '097299090');
    SecondryPostShareModel secondry = SecondryPostShareModel(
        numberOfShare: 200, pricePerShare: 300.0, date: '2024/12/1');
    bool dark = SHelperFunction.isDarkMode(context);

    void _showDeclineDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          String reason = "";
          return AlertDialog(
            title: Text('Decline Reason'),
            content: TextField(
              onChanged: (value) {
                reason = value;
              },
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
                onPressed: () {
                  // Handle the decline action here with the reason
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Submit'),
              ),
            ],
          );
        },
      );
    }

    return Container(
      height: 140, // Adjusted height to accommodate seller info
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
                  Text("Seller: ${User.firstName} ${User.lastName}",
                      style: dark
                          ? STextTheme.darkTextTheme.headlineSmall
                          : STextTheme.lightTextTheme.headlineSmall),
                  Text("Buyer: ${User2.firstName} ${User2.lastName}",
                      style: TextStyle(
                        fontSize: 14,
                        color: dark ? Colors.white : Colors.black,
                      )),
                  Row(
                    children: [
                      Text(
                        'No of Share : ${secondry.numberOfShare.toString()}',
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
                            "${secondry.pricePerShare} Birr",
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
                            "${secondry.date}",
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
                onPressed: () {
                  // Handle accept action
                },
                child: Text('Accept'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _showDeclineDialog,
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

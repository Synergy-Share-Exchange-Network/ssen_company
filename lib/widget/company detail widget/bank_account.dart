import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/helper_function.dart';

class BankInformationWidget extends StatelessWidget {
  final String bankname;
  final String savingaccount;
  final String checkingaccount;
  const BankInformationWidget({
    Key? key,
    required this.bankname,
    required this.savingaccount,
    required this.checkingaccount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);

    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 350,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Bank Name: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(bankname,
                    style: dark
                        ? STextTheme.darkTextTheme.headlineSmall
                        : STextTheme.lightTextTheme.headlineSmall),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Saving Account:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  maxLines:
                      2, // Adjust the number of lines you want to show initially
                  overflow: TextOverflow.ellipsis,
                  savingaccount,
                  style: dark
                      ? STextTheme.darkTextTheme.bodySmall
                      : STextTheme.lightTextTheme.bodySmall,
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Checking Account:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  maxLines:
                      2, // Adjust the number of lines you want to show initially
                  overflow: TextOverflow.ellipsis,
                  checkingaccount,
                  style: dark
                      ? STextTheme.darkTextTheme.bodySmall
                      : STextTheme.lightTextTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

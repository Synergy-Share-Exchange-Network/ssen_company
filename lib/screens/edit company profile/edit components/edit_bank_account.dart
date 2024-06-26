import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/screens/partial%20screen/edit%20company%20detail/add_bank_account.dart';
import 'package:ssen_company/widget/company%20detail%20widget/bank_account.dart';

import '../../../Models/company_profile_model.dart';
import '../../../provider/company_provider.dart';
import '../../../utils/constants.dart';

class EditBankAccount extends StatelessWidget {
  const EditBankAccount({super.key});
  static const route = "edit_bank_account";
  // final List<String> bankAccount;

  @override
  Widget build(BuildContext context) {
    CompanyProfileModel company = Provider.of<UserProvider>(context).getCompany;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Edit Bank Account',
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
              onPressed: () {
                (MediaQuery.of(context).size.width > phoneSize)
                    ? showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              actions: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  width: (MediaQuery.of(context).size.width >
                                          phoneSize)
                                      ? MediaQuery.of(context).size.width - 600
                                      : MediaQuery.of(context).size.width,
                                  height: (MediaQuery.of(context).size.width >
                                          phoneSize)
                                      ? MediaQuery.of(context).size.height - 150
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
                                            "Add Bank Account",
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
                                        child: AddBankAccount(),
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
                            builder: (context) => const AddBankAccount()));
              },
              child: Text("Add Bank Account"),
            ),
          )
        ],
      ),
      body: (company.bankAccount != [] || company.bankAccount != [''])
          ? ListView.builder(
              itemCount: company.bankAccount.length,
              itemBuilder: (context, index) {
                // List<String> info = company.bankAccount[index].split(',');
                return EditBankPreviousInformation(
                  bankAccount: company.bankAccount[index].split(','),
                );
              },
            )
          : Center(
              child: Text("No Accounts Added"),
            ),

      // Your form fields for editing bank account details can go here
    );
  }
}

class EditBankPreviousInformation extends StatelessWidget {
  const EditBankPreviousInformation({
    Key? key,
    required this.bankAccount,
  }) : super(key: key);

  final List<String> bankAccount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          BankInformationWidget(
            bankname: bankAccount[0],
            savingaccount: bankAccount[1],
            checkingaccount: bankAccount[2],
          ),
          //     bankname: 'CBE',
          //     savingaccount: '1000254136',
          //     checkingaccount: '1000254136'),
          Positioned(
            top: 8.0,
            right: 8.0,
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

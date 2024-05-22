import 'package:flutter/material.dart';
import 'package:ssen_company/widget/company%20detail%20widget/bank_account.dart';

class EditBankAccount extends StatelessWidget {
  const EditBankAccount({super.key, required this.bankAccount});
  static const route = "edit_bank_account";
  final List<String> bankAccount;

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              child: Text("Add Bank Account"),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditBankPreviousInformation(),
                EditBankPreviousInformation(),
                EditBankPreviousInformation(),
                EditBankPreviousInformation(),

                // Your form fields for editing bank account details can go here
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditBankPreviousInformation extends StatelessWidget {
  const EditBankPreviousInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          BankInformationWidget(
              bankname: 'CBE',
              savingaccount: '1000254136',
              checkingaccount: '1000254136'),
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

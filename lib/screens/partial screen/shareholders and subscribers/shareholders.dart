import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/Models/user_model.dart';
import 'package:ssen_company/provider/company_provider.dart';
import 'package:ssen_company/widget/payment_pending_request_widget.dart';
import 'package:ssen_company/widget/shareholder_widget.dart';

import '../../../repository/firebase/key words/collection_name.dart';

class ShareHolders extends StatelessWidget {
  const ShareHolders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CompanyProfileModel? company =
        Provider.of<UserProvider>(context).getCompany;
    List<String> shareHolderID = company.termconditionID;
    shareHolderID.removeWhere((item) => item == "");
    shareHolderID = shareHolderID.toSet().toList();

    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(CollectionName.user)
                .orderBy('userCreatedDate', descending: true)
                .where('identification', whereIn: shareHolderID)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              List<UserModel> users = snapshot.data!.docs.map((document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return UserModel.fromMap(data);
              }).toList();

              return SingleChildScrollView(
                child: (users.isEmpty)
                    ? const Center(
                        child: Text("No Data"),
                      )
                    : Column(
                        children: users.map((user) {
                          return ShareHoldersWidget(user: user);
                        }).toList(),
                      ),
              );
            }));
  }
}

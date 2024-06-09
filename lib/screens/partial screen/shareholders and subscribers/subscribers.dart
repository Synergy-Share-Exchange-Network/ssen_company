import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/Models/user_model.dart';
import 'package:ssen_company/Repository/firebase/key%20words/collection_name.dart';
import 'package:ssen_company/provider/company_provider.dart';
import 'package:ssen_company/widget/payment_pending_request_widget.dart';
import 'package:ssen_company/widget/subscriber_widget.dart';

class Subscribers extends StatelessWidget {
  const Subscribers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CompanyProfileModel? company =
        Provider.of<UserProvider>(context).getCompany;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(CollectionName.user)
            .orderBy('userCreatedDate', descending: true)
            .where('companiesId', arrayContains: company.identification)
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
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return UserModel.fromMap(data);
          }).toList();

          return SingleChildScrollView(
            child: (users.isEmpty)
                ? const Center(
                    child: Text("No Data"),
                  )
                : Column(
                    children: users.map((user) {
                      return SubscriberWidget(user: user);
                    }).toList(),
                  ),
          );
        });
  }
}

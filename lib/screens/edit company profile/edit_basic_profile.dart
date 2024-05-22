import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/Repository/firebase/key%20words/collection_name.dart';
import 'package:ssen_company/Repository/firebase/model%20methods/firebase_update_methods.dart';
import 'package:ssen_company/provider/company_provider.dart';
import 'package:ssen_company/screens/state%20pages/company_profile.dart';

class EditBasicCompanyProfile extends StatefulWidget {
  const EditBasicCompanyProfile({Key? key}) : super(key: key);

  @override
  State<EditBasicCompanyProfile> createState() =>
      _EditBasicCompanyProfileState();
}

class _EditBasicCompanyProfileState extends State<EditBasicCompanyProfile> {
  @override
  Widget build(BuildContext context) {
    CompanyProfileModel company = Provider.of<UserProvider>(context).getCompany;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          IndividualAttribute(
            attribute: 'Company Name',
            value: company.name,
            DBattribute: 'name',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'Business Sector',
            value: company.businessSector,
            DBattribute: 'businessSector',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'Line of Business',
            value: company.lineOfBusiness,
            DBattribute: 'lineOfBusiness',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'Year of Establishment',
            value: company.yearOfEstablishment,
            DBattribute: 'yearOfEstablishment',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'Motto',
            value: company.motto,
            DBattribute: 'motto',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'Description',
            value: company.description,
            DBattribute: 'description',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'Mission',
            value: company.mission,
            DBattribute: 'mission',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'Vision',
            value: company.vision,
            DBattribute: 'vision',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'Value',
            value: company.value,
            DBattribute: 'value',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'Target',
            value: company.target,
            DBattribute: 'target',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'Goal',
            value: company.goal,
            DBattribute: 'goal',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'History',
            value: company.history,
            DBattribute: 'history',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'Milestone',
            value: company.mileStone,
            DBattribute: 'mileStone',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'Location Description',
            value: company.locationDescription,
            DBattribute: 'locationDescription',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'User Requirement',
            value: company.userRequirment,
            DBattribute: 'userRequirment',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'Phone Number',
            value: company.phoneNumber,
            DBattribute: 'phoneNumber',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'PO Box',
            value: company.poBox,
            DBattribute: 'poBox',
            company: company,
          ),
          IndividualAttribute(
            attribute: 'TIN Number',
            value: company.tinNumber,
            DBattribute: 'tinNumber',
            company: company,
          ),
          IndividualAttributeDouble(
              attribute: "Total Capital Of Company",
              value: company.capital.toString(),
              DBattribute: 'capital',
              company: company),
          IndividualAttributeDouble(
              attribute: "Total Aimed Capital Of Company",
              value: company.aimedCapital.toString(),
              DBattribute: 'aimedCapital',
              company: company)
        ],
      ),
    ));
  }
}

class IndividualAttribute extends StatelessWidget {
  const IndividualAttribute({
    Key? key,
    required this.attribute,
    required this.value,
    required this.DBattribute,
    required this.company,
  }) : super(key: key);
  final String attribute;
  final String value;
  final String DBattribute;
  final CompanyProfileModel company;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: (value != '') ? Text(value) : Text("Not Set"),
          subtitle: Text(attribute),
          trailing: Icon(Icons.edit),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                TextEditingController _controller =
                    TextEditingController(text: value);
                return AlertDialog(
                  title: Text('Edit $attribute'),
                  content: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: attribute,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // onSave(_controller.text);
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            content: Container(
                              padding: EdgeInsets.all(20),
                              height: 130,
                              child: Column(
                                children: [
                                  const CircularProgressIndicator(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text("Updating $attribute"),
                                ],
                              ),
                            ),
                          ),
                        );
                        await FirebaseFirestore.instance
                            .collection(CollectionName.organization)
                            .doc(company.identification)
                            .update({
                          DBattribute: _controller.text.trim(),
                        });
                        await Provider.of<UserProvider>(context, listen: false)
                            .refreshUser();

                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ],
                );
              },
            );
          },
        ),
        Divider(),
      ],
    );
  }
}

class IndividualAttributeDouble extends StatelessWidget {
  const IndividualAttributeDouble({
    Key? key,
    required this.attribute,
    required this.value,
    required this.DBattribute,
    required this.company,
  }) : super(key: key);
  final String attribute;
  final String value;
  final String DBattribute;
  final CompanyProfileModel company;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: (value != '') ? Text(value) : Text("Not Set"),
          subtitle: Text(attribute),
          trailing: Icon(Icons.edit),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                TextEditingController _controller =
                    TextEditingController(text: value);
                return AlertDialog(
                  title: Text('Edit $attribute'),
                  content: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: attribute,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // onSave(_controller.text);
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            content: Container(
                              padding: EdgeInsets.all(20),
                              height: 130,
                              child: Column(
                                children: [
                                  const CircularProgressIndicator(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text("Updating $attribute"),
                                ],
                              ),
                            ),
                          ),
                        );
                        await FirebaseFirestore.instance
                            .collection(CollectionName.organization)
                            .doc(company.identification)
                            .update({
                          DBattribute:
                              double.tryParse(_controller.text.trim()) ?? 0,
                        });
                        await Provider.of<UserProvider>(context, listen: false)
                            .refreshUser();

                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ],
                );
              },
            );
          },
        ),
        Divider(),
      ],
    );
  }
}

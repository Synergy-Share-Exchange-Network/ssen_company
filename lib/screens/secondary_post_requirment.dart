import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/Models/company_requirement_on_secondry_market_model.dart';
import 'package:ssen_company/provider/company_provider.dart';
import 'package:ssen_company/repository/firebase/model%20methods/firebase_company_requirements_methods.dart';

// ignore: depend_on_referenced_packages

import '../utils/constants.dart';
import '../utils/constants/size.dart';
import '../utils/constants/text_string.dart';

class SecondaryPostRequirment extends StatefulWidget {
  const SecondaryPostRequirment({super.key, required this.comReq});
  final CompanyRequirementOnSecondryMarketModel comReq;

  @override
  State<SecondaryPostRequirment> createState() =>
      _SecondaryPostRequirmentState();
}

class _SecondaryPostRequirmentState extends State<SecondaryPostRequirment> {
  TextEditingController maxNumberOfShareToSell = TextEditingController();
  TextEditingController minNumberOfShareToSell = TextEditingController();
  TextEditingController minimumPricePerShare = TextEditingController();
  TextEditingController maximumPricePerShare = TextEditingController();

  late bool isOpentoSell;

  @override
  void initState() {
    maxNumberOfShareToSell.text =
        widget.comReq.maximumNumberOfShareToSell.toString();
    minNumberOfShareToSell.text =
        widget.comReq.minimumNumberOfShareToSell.toString();
    minimumPricePerShare.text = widget.comReq.minimumPricePerShare.toString();
    maximumPricePerShare.text = widget.comReq.maximumPricePerShare.toString();
    isOpentoSell = widget.comReq.isOpenToSell;

    super.initState();
  }

  void addReq(String companyID) async {
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
              Text("Adding Secondary Requirement..."),
            ],
          ),
        ),
      ),
    );
    CompanyRequirementOnSecondryMarketModel req =
        CompanyRequirementOnSecondryMarketModel(
            maximumNumberOfShareToSell:
                double.parse(maxNumberOfShareToSell.text.trim()),
            minimumNumberOfShareToSell:
                double.parse(minNumberOfShareToSell.text.trim()),
            minimumPricePerShare:
                double.parse(minimumPricePerShare.text.trim()),
            maximumPricePerShare:
                double.parse(maximumPricePerShare.text.trim()),
            isOpenToSell: isOpentoSell);
    await FirebaseCompanyRequirementsMethods().create(companyID, req);
    await Provider.of<UserProvider>(context, listen: false).refreshUser();
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    CompanyProfileModel? company =
        Provider.of<UserProvider>(context).getCompany;
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Secondary Share Requirment'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: (MediaQuery.of(context).size.width < phoneSize)
                  ? MediaQuery.of(context).size.width
                  : 500,
            ),
            child: Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            // const FormElement(
                            //   title: "No of Share",
                            //   important: true,
                            // ),
                            const SizedBox(
                              height: SSizes.spaceBtwItems / 2,
                            ),
                            TextFormField(
                              controller: maxNumberOfShareToSell,
                              decoration: const InputDecoration(
                                  labelText: "max no of share to sell"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: SSizes.spaceBtwItems,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            // const FormElement(
                            //   title: "Per Share Price",
                            //   important: true,
                            // ),
                            const SizedBox(
                              height: SSizes.spaceBtwItems / 2,
                            ),
                            TextFormField(
                              controller: minNumberOfShareToSell,
                              decoration: const InputDecoration(
                                  labelText: "min no of share to sell"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const FormElement(
                      //   title: "Contact",
                      // ),
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        controller: minimumPricePerShare,
                        decoration: InputDecoration(
                            labelText: 'minimum price per share'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const FormElement(
                      //   title: "Company Name",
                      // ),
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        controller: maximumPricePerShare,
                        decoration: const InputDecoration(
                            labelText: "maximum price per share"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const FormElement(
                      //   title: "Company Name",
                      // ),
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      // TextFormField(
                      //   controller: isOpenToSell,
                      //   decoration:
                      //       const InputDecoration(labelText: 'is open to sell'),
                      // ),
                      CupertinoSwitch(
                        value: isOpentoSell,
                        onChanged: (value) {
                          setState(() {
                            isOpentoSell = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // Implement your post functionality here
                            Navigator.pop(context);
                          },
                          child: Text('  Discard  '),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          )),
                      ElevatedButton(
                        onPressed: () {
                          addReq(company.identification);
                        },
                        child: Text('   Save   '),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

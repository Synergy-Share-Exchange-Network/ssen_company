import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/share_model.dart';
import 'package:ssen_company/Repository/firebase/model%20methods/firebase_share_methods.dart';
import 'package:ssen_company/provider/company_provider.dart';

import '../../Models/company_profile_model.dart';
import '../../services/theme/text_theme.dart';
import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/size.dart';
import '../../utils/constants/text_string.dart';
import '../../utils/helper_function.dart';
import '../../utils/utils.dart';
import 'form_step.dart';
import 'formelement.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPost();
}

class _AddPost extends State<AddPost> {
  ScrollController form1ScrollController = ScrollController();
  ScrollController form2ScrollController = ScrollController();
  ScrollController form3ScrollController = ScrollController();
  List<Uint8List>? images;
  bool _isImageSelected = false;

  int formIndex = 0;
  final List<String> items = [
    'CBE',
    'BOA',
    'NIB',
    'OBA',
  ];
  void _selectImages() async {
    List<XFile> im = await ImagePicker().pickMultiImage();
    images = await convertXFileListToUint8ListList(im);
    _isImageSelected = true;
    if (images!.length == 0) {
      _isImageSelected = false;
    }
    setState(() {});
  }

  void _selectIndividualImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    images!.add(im);
    // need to remove duplicated item
    // _images = Set.of(_images!).toList();
    setState(() {});
  }

  String? selectedValue;
  final TextEditingController savingAccountPercentageController =
      TextEditingController();
  final TextEditingController proclamationNumberController =
      TextEditingController();
  final TextEditingController minimumNumberOfBuyerController =
      TextEditingController();
  final TextEditingController maximumNumberOfBuyerController =
      TextEditingController();
  final TextEditingController bankInformationController =
      TextEditingController();
  final TextEditingController unitSharePriceController =
      TextEditingController();
  final TextEditingController noOfSharesController = TextEditingController();
  final TextEditingController dividentInPercentController =
      TextEditingController();
  final TextEditingController dividentTimeInMonthController =
      TextEditingController();
  final TextEditingController dividentDescriptionController =
      TextEditingController();
  final TextEditingController minimumPaymentInPercentController =
      TextEditingController();
  final TextEditingController minimumNumberOfSharesToBuyController =
      TextEditingController();
  final TextEditingController maximumNumberOfSharesToBuyController =
      TextEditingController();
  final TextEditingController requirementController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();
  // final TextEditingController searchKeyWordsController =
  //     TextEditingController();

  final TextEditingController timeToReturnRemainPaymentController =
      TextEditingController();
  final TextEditingController currencyController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController savingAccountForBankController =
      TextEditingController();
  final TextEditingController checkingAccountForBankController =
      TextEditingController();

  List<String> bankAccount = [''];
  @override
  void dispose() {
    savingAccountPercentageController.dispose();
    proclamationNumberController.dispose();
    minimumNumberOfBuyerController.dispose();
    maximumNumberOfBuyerController.dispose();
    bankInformationController.dispose();
    unitSharePriceController.dispose();
    noOfSharesController.dispose();
    dividentInPercentController.dispose();
    dividentTimeInMonthController.dispose();
    dividentDescriptionController.dispose();
    minimumPaymentInPercentController.dispose();
    minimumNumberOfSharesToBuyController.dispose();
    maximumNumberOfSharesToBuyController.dispose();
    requirementController.dispose();

    descriptionController.dispose();
    // searchKeyWordsController.dispose();
    timeToReturnRemainPaymentController.dispose();
    currencyController.dispose();
    savingAccountForBankController.dispose();
    checkingAccountForBankController.dispose();
    bankNameController.dispose();
  }

  void addshare(CompanyProfileModel company) async {
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
              Text("Posting Share..."),
            ],
          ),
        ),
      ),
    );
// Function to parse a string to double with a default value of 0.0 if parsing fails
    double parseDoubleOrDefault(String text) {
      try {
        return double.parse(text.trim());
      } catch (e) {
        return 0.0;
      }
    }

// Function to parse a string to int with a default value of 0 if parsing fails
    int parseIntOrDefault(String text) {
      try {
        return int.parse(text.trim());
      } catch (e) {
        return 0;
      }
    }

    double savingAccountPercentage =
        parseDoubleOrDefault(savingAccountPercentageController.text);
    String proclamationNumber = proclamationNumberController.text.trim();
    int minimumNumberOfBuyer =
        parseIntOrDefault(minimumNumberOfBuyerController.text);
    int maximumNumberOfBuyer =
        parseIntOrDefault(maximumNumberOfBuyerController.text);
// Similar operations for other fields...

    String requirement = requirementController.text.trim();
    String description = descriptionController.text.trim();
    List<String> returnDividentDescription = [
      dividentTimeInMonthController.text,
      dividentDescriptionController.text
    ];
    int timeToReturnRemainPayment =
        parseIntOrDefault(timeToReturnRemainPaymentController.text);
    String currency = currencyController.text.trim();
    String date = DateTime.now().toString();
    // print(savingAccountPercentage);
    // print(proclamationNumber);
    ShareModel share = ShareModel(
        // savingAccountPercentage: savingAccountPercentage,
        savingAccountPercentage: savingAccountPercentage,
        proclamationNumber: proclamationNumber,
        minimumNumberOfBuyer: minimumNumberOfBuyer,
        maximumNumberOfBuyer: maximumNumberOfBuyer,
        bankInformation: bankAccount,
        unitSharePrice: parseDoubleOrDefault(unitSharePriceController.text),
        noOfShares: parseDoubleOrDefault(noOfSharesController.text),
        divident: parseDoubleOrDefault(dividentInPercentController.text),
        minimumPaymentInPercent:
            parseDoubleOrDefault(minimumPaymentInPercentController.text),
        minimumNumberOfSharesToBuy:
            parseDoubleOrDefault(minimumNumberOfSharesToBuyController.text),
        maximumNumberOfSharesToBuy:
            parseDoubleOrDefault(maximumNumberOfSharesToBuyController.text),
        requirement: requirement,
        description: description,
        returnDividentDescription: returnDividentDescription,
        timeToReturnRemainPayment: timeToReturnRemainPayment,
        currency: currency,
        dateAdded: date,
        shareImage: ['']);

    // ShareModel share = ShareModel(
    //   savingAccountPercentage:
    //       double.parse(savingAccountPercentageController.text.trim()),
    //   proclamationNumber: proclamationNumberController.text.trim(),
    //   minimumNumberOfBuyer:
    //       int.parse(minimumNumberOfBuyerController.text.trim()),
    //   maximumNumberOfBuyer:
    //       int.parse(maximumNumberOfBuyerController.text.trim()),
    //   bankInformation: bankAccount,
    //   unitSharePrice: double.parse(unitSharePriceController.text.trim()),
    //   noOfShares: double.parse(noOfSharesController.text.trim()),
    //   divident: double.parse(dividentInPercentController.text.trim()),
    //   minimumPaymentInPercent:
    //       double.parse(minimumPaymentInPercentController.text.trim()),
    //   minimumNumberOfSharesToBuy:
    //       double.parse(minimumNumberOfSharesToBuyController.text.trim()),
    //   maximumNumberOfSharesToBuy:
    //       double.parse(maximumNumberOfSharesToBuyController.text.trim()),
    //   requirement: requirementController.text.trim(),
    //   description: descriptionController.text.trim(),
    //   // searchKeyWords: searchKeyWordsController.text.trim().split(',').map((e) => e.trim()).toList(),
    //   returnDividentDescription: [
    //     dividentTimeInMonthController.text,
    //     dividentDescriptionController.text
    //   ],
    //   timeToReturnRemainPayment:
    //       int.parse(timeToReturnRemainPaymentController.text.trim()),
    //   currency: currencyController.text.trim(),
    // );

    print(share);
    print(company);
    String sharePosted =
        await FirebaseShareMethods().create(share, company, images);
    // String branchCreated = await FirebaseBranchRepositry().createBranch(
    //     branch: branch,
    //     humanResourceEmployee: humanResourceEmployee,
    //     humanResourceEmployeepassword: passwordController.text,
    //     mainImage: mainImage,
    //     humanResourceImage: humanResourceImage);
    print(sharePosted);
    Navigator.pop(context);
    if (sharePosted == "success") {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Container(
            padding: EdgeInsets.all(20),
            height: 100,
            child: Column(
              children: [
                const Text("Succesfully Posted Share."),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      // await FlutterSecureStorageEmailAndPasswordMethod()
                      //     .signInUsingLocalData();
                      // Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      // Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Text("   Okay   "))
              ],
            ),
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Container(
            padding: EdgeInsets.all(20),
            height: 125,
            child: Column(
              children: [
                Text("Error: $sharePosted",
                    style: TextStyle(color: Colors.red)),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      // await FlutterSecureStorageEmailAndPasswordMethod()
                      //     .signInUsingLocalData();
                      // Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: const Text("   Okay   "))
              ],
            ),
          ),
        ),
      );
    }
  }

  get file => null;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    CompanyProfileModel company = Provider.of<UserProvider>(context).getCompany;

    return Scaffold(
      appBar: (MediaQuery.of(context).size.width > phoneSize)
          ? null
          : AppBar(
              title: Text(
                'Add Post',
                style: dark
                    ? STextTheme.darkTextTheme.titleLarge
                    : STextTheme.lightTextTheme.titleLarge,
              ),
              backgroundColor:
                  !dark ? SColors.lighGrey : SColors.homePageNavBar,

              // elevation: 1,
            ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: formIndex,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const FormStep(
                                index: 1,
                              ),
                              SizedBox(
                                height: SSizes.spaceBtwItems,
                              ),
                              Text(
                                "Description and Requirment ",
                                style: dark
                                    ? STextTheme.darkTextTheme.titleMedium
                                    : STextTheme.lightTextTheme.titleMedium,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(SSizes.defaultSpace),
                        child: Column(
                          children: [
                            // for one

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElement(
                                  title: "proclamation",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  controller: proclamationNumberController,
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Iconsax.call),
                                      labelText: SText.proclamation),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            //end
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElementLarge(
                                  title: "Requirement Document of Users",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  controller: requirementController,
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Iconsax.message),
                                      labelText: SText.Requirement),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            //end
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElement(
                                  title: "Descrination",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  controller: descriptionController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText: SText.Descrination,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElement(
                                  title: "Saving Account Percentage Controller",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  controller: savingAccountPercentageController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText:
                                        'Saving Account Percentage Controller',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            Text('KeyWords',
                                style: dark
                                    ? STextTheme.darkTextTheme.titleSmall
                                    : STextTheme.lightTextTheme.titleSmall),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                          decoration: const InputDecoration(
                                        labelText: SText.keyword,
                                      )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: SSizes.spaceBtwItems,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: SText.keyword),
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
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: SText.keyword),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: SSizes.spaceBtwItems,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            //the other one
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                          decoration: const InputDecoration(
                                        labelText: SText.keyword,
                                      )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: SSizes.spaceBtwItems,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: SText.keyword),
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
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: SText.keyword),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: SSizes.spaceBtwItems,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            //the next page
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                          decoration: const InputDecoration(
                                        labelText: SText.keyword,
                                      )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: SSizes.spaceBtwItems,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: SText.keyword),
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
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: SText.keyword),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: SSizes.spaceBtwItems,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                // nextpage
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const FormStep(
                                index: 2,
                              ),
                              SizedBox(
                                height: SSizes.spaceBtwItems,
                              ),
                              Text(
                                "Offering",
                                style: dark
                                    ? STextTheme.darkTextTheme.titleMedium
                                    : STextTheme.lightTextTheme.titleMedium,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwSections / 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(SSizes.defaultSpace),
                        child: Column(
                          children: [
                            // for two textfield
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElementLarge(
                                  title: "Total No of Share Of Company",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  controller: noOfSharesController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText: SText.noOfShare,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElementLarge(
                                  title: "Share Unit Price",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  controller: unitSharePriceController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText: SText.noOfShare,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            // for one text field
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElementLarge(
                                  title: "Minimum  Share To Buy",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  controller:
                                      minimumNumberOfSharesToBuyController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText: SText.minimumNumberOfShare,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElement(
                                  title: "Maximum Share To Buy",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  controller:
                                      maximumNumberOfSharesToBuyController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText: "Maximum Share To Buy",
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElementLarge(
                                  title: "Dividend In Percent",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  controller: dividentInPercentController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText: "Dividend In Percent",
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElementLarge(
                                  title: "Dividend Time In Months",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  controller: dividentTimeInMonthController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText: "Dividend Time",
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElementLarge(
                                  title: "Dividend Description",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  controller: dividentDescriptionController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText: "Dividend Description",
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElementLarge(
                                  title: "Minimumpayment in Percent",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  controller: minimumPaymentInPercentController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText: "Minimumpayment in Percent",
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElement(
                                  title: "Currency",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  controller: currencyController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText: 'Currency',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),

                            //end
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: Column(
                            //         children: [
                            //           const FormElement(
                            //             title: "Min Payment",
                            //           ),
                            //           const SizedBox(
                            //             height: SSizes.spaceBtwItems / 2,
                            //           ),
                            //           TextFormField(
                            //             decoration: const InputDecoration(
                            //                 labelText: SText.minpayment),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     const SizedBox(
                            //       width: SSizes.spaceBtwItems,
                            //     ),
                            //     Expanded(
                            //       child: Column(
                            //         children: [
                            //           const FormElement(
                            //             title: "Max Payment",
                            //           ),
                            //           const SizedBox(
                            //             height: SSizes.spaceBtwItems / 2,
                            //           ),
                            //           TextFormField(
                            //             decoration: const InputDecoration(
                            //                 labelText: SText.maxpayment),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     const SizedBox(
                            //       width: SSizes.spaceBtwItems,
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const FormStep(
                                index: 3,
                              ),
                              SizedBox(
                                height: SSizes.spaceBtwItems,
                              ),
                              Text(
                                "Add Image",
                                style: dark
                                    ? STextTheme.darkTextTheme.titleMedium
                                    : STextTheme.lightTextTheme.titleMedium,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      Column(
                        children: [
                          if (_isImageSelected == false)
                            SizedBox(
                              width: 320,
                              // height: 50,
                              child: ElevatedButton(
                                  onPressed: () {
                                    _selectImages();
                                  },
                                  child: const Text("Add Share Images")),
                            ),
                          if (_isImageSelected)
                            Column(
                              children: [
                                Container(
                                  width: 330,
                                  height: (images!.length > 4) ? 450 : 300,
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                      ),
                                      itemCount: images!.length,
                                      itemBuilder: (context, index) {
                                        return AddImage(
                                          deleteCallback: () {
                                            images!.removeAt(index);
                                            setState(() {});
                                          },
                                          file: images![index],
                                          callback: () {},
                                        );
                                      }),
                                ),
                                AddImage(
                                    callback: _selectIndividualImage,
                                    deleteCallback: () {})
                              ],
                            )
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(SSizes.defaultSpace),
                      //   child: Column(
                      //     children: [
                      //space for the image picker
                      // Container(
                      //   width: (MediaQuery.of(context).size.width >
                      //           phoneSize)
                      //       ? 400
                      //       : MediaQuery.of(context).size.width - 150,
                      //   height: (MediaQuery.of(context).size.width >
                      //           phoneSize)
                      //       ? 430
                      //       : MediaQuery.of(context).size.width - 130,
                      //   decoration: BoxDecoration(
                      //     border: Border.all(
                      //         color: Color.fromARGB(34, 33, 149, 243),
                      //         width: 2),
                      //     color: Colors.white,
                      //   ),
                      //   child: (file == null)
                      //       ? Container(
                      //           margin: const EdgeInsets.all(8),
                      //           child: Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.center,
                      //             children: [
                      //               Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.center,
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: const [
                      //                   Center(
                      //                     child: Text(
                      //                       "Add Post Image",
                      //                       overflow:
                      //                           TextOverflow.ellipsis,
                      //                       style: TextStyle(
                      //                           color: SColors.primary,
                      //                           fontSize: 20,
                      //                           fontWeight:
                      //                               FontWeight.normal),
                      //                     ),
                      //                   ),
                      //                   SizedBox(
                      //                     height: 25,
                      //                   ),
                      //                   Icon(
                      //                     Icons.add,
                      //                     color: SColors.primary,
                      //                     size: 30,
                      //                   )
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //         )
                      //       : Stack(
                      //           alignment: AlignmentDirectional.topEnd,
                      //           children: [
                      //             // Image.file(
                      //             //   File(file!.path.toString()),
                      //             //   width: 400,
                      //             //   height: 430,
                      //             //   fit: BoxFit.cover,
                      //             // ),
                      //             Container(
                      //               width: 400,
                      //               height: 430,
                      //               decoration: BoxDecoration(
                      //                   image: DecorationImage(
                      //                       fit: BoxFit.cover,
                      //                       image: MemoryImage(file!))),
                      //             ),
                      //             IconButton(
                      //                 onPressed: () {},
                      //                 icon: const Icon(
                      //                   Icons.delete_outline_outlined,
                      //                   color: Colors.red,
                      //                 ))
                      //           ],
                      //         ),
                      // ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),

                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const FormStep(
                                index: 4,
                              ),
                              SizedBox(
                                height: SSizes.spaceBtwItems,
                              ),
                              Text(
                                "Add Bank Accounts",
                                style: dark
                                    ? STextTheme.darkTextTheme.titleMedium
                                    : STextTheme.lightTextTheme.titleMedium,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            if (bankAccount[0] != '' || bankAccount.isEmpty)
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: bankAccount.length,
                                itemBuilder: (BuildContext context, int index) {
                                  List<String> accountInfo =
                                      bankAccount[index].split(',');
                                  String bankName = accountInfo[0];
                                  String savingAccount = accountInfo[1];
                                  String checkingAccount = accountInfo[2];

                                  return Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Bank Name:",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(bankName)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Saving Account:",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(savingAccount)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Checking Account:",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(checkingAccount)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              bankAccount.removeAt(index);
                                              setState(() {});
                                            },
                                            child: Text("Delete"),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.red),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Add Bank Account'),
                                      content: Container(
                                        height: 320,
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("Bank Name:"),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                TextFormField(
                                                  controller:
                                                      bankNameController,
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'Bank Name',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("Saving Account:"),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                TextFormField(
                                                  controller:
                                                      savingAccountForBankController,
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'Saving Account',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("Checking Account:"),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                TextFormField(
                                                  controller:
                                                      checkingAccountForBankController,
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText:
                                                        'Checking Account',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            bankNameController.text = "";
                                            savingAccountForBankController
                                                .text = "";
                                            checkingAccountForBankController
                                                .text = "";
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Text('Close'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            String bankInformation =
                                                "${bankNameController.text},${savingAccountForBankController.text},${checkingAccountForBankController.text}";
                                            bankAccount.add(bankInformation);
                                            bankAccount.removeWhere(
                                                (element) => element.isEmpty);
                                            Navigator.pop(context);
                                            bankNameController.text = "";
                                            savingAccountForBankController
                                                .text = "";
                                            checkingAccountForBankController
                                                .text = "";
                                            setState(() {});
                                            print(bankAccount);
                                          },
                                          child: Text('Save'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text("Add Account"),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: (MediaQuery.of(context).size.width > phoneSize)
                ? const EdgeInsets.all(2)
                : const EdgeInsets.fromLTRB(0, 20, 10, 5),
            height: 30,
            child: Row(
              children: [
                const Expanded(flex: 1, child: SizedBox()),
                formIndex > 0
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            formIndex--;
                          });
                        },
                        child: Text(" Privious "))
                    : const SizedBox(
                        width: 60,
                      ),
                const Expanded(flex: 10, child: SizedBox()),
                formIndex != 3
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            formIndex++;
                          });
                        },
                        child: const Text("   Next   "))
                    : ElevatedButton(
                        onPressed: () {
                          addshare(company);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.orange),
                        child: const Text("   Post   ")),
                const Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AddImage extends StatelessWidget {
  const AddImage({
    Key? key,
    required this.callback,
    this.file,
    required this.deleteCallback,
  }) : super(key: key);
  final VoidCallback callback;
  final VoidCallback deleteCallback;
  final Uint8List? file;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
          child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(6),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(34, 33, 149, 243)),
                        color: Colors.white,
                      ),
                      width: (MediaQuery.of(context).size.width > phoneSize)
                          ? 150
                          : 110,
                      height: (MediaQuery.of(context).size.width > phoneSize)
                          ? 150
                          : 110,
                      child: (file == null)
                          ? Container(
                              margin: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          "Add Image",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: (MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      phoneSize)
                                                  ? 17
                                                  : 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Icon(
                                        Icons.add,
                                        color: Colors.blue,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                // Image.file(
                                //   File(file!.path.toString()),
                                //   width: 150,
                                //   height: 130,
                                //   fit: BoxFit.cover,
                                // ),
                                Container(
                                  width: 150,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: MemoryImage(file!))),
                                ),
                                IconButton(
                                    onPressed: deleteCallback,
                                    icon: const Icon(
                                      Icons.delete_outline_outlined,
                                      color: Colors.red,
                                      size: 20,
                                    ))
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

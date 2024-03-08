import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/size.dart';
import '../../utils/constants/text_string.dart';
import '../../utils/helper_function.dart';
import 'form_step.dart';
import 'formelement.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPost();
}

class _AddPost extends State<AddPost> {
  int formIndex = 0;
  final List<String> items = [
    'CBE',
    'BOA',
    'NIB',
    'OBA',
  ];

  String? selectedValue;

  get file => null;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Post',
          style: dark
              ? STextTheme.darkTextTheme.titleLarge
              : STextTheme.lightTextTheme.titleLarge,
        ),
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
                                const FormElement(
                                  title: "Requirement",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
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
                                const FormElement(
                                  title: "No of Share",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
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
                                const FormElement(
                                  title: "Minimum  Share ",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
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
                                  title: "Maximum Share",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText: SText.maximumNumberOfShare,
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
                                  title: "Dividend",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText: SText.Dividend,
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
                                  title: "Dividend Time",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.message),
                                    labelText: SText.Dividend,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const FormElement(
                                        title: "Min Payment",
                                      ),
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: SText.minpayment),
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
                                      const FormElement(
                                        title: "Max Payment",
                                      ),
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: SText.maxpayment),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: SSizes.spaceBtwItems,
                                ),
                              ],
                            ),
                            //end
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const FormElement(
                                        title: "Min Payment",
                                      ),
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: SText.minpayment),
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
                                      const FormElement(
                                        title: "Max Payment",
                                      ),
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: SText.maxpayment),
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
                      Padding(
                        padding: const EdgeInsets.all(SSizes.defaultSpace),
                        child: Column(
                          children: [
                            //space for the image picker
                            Container(
                              width: (MediaQuery.of(context).size.width >
                                      phoneSize)
                                  ? 400
                                  : MediaQuery.of(context).size.width - 150,
                              height: (MediaQuery.of(context).size.width >
                                      phoneSize)
                                  ? 430
                                  : MediaQuery.of(context).size.width - 130,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(34, 33, 149, 243),
                                    width: 2),
                                color: Colors.white,
                              ),
                              child: (file == null)
                                  ? Container(
                                      margin: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Center(
                                                child: Text(
                                                  "Add Post Image",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: SColors.primary,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Icon(
                                                Icons.add,
                                                color: SColors.primary,
                                                size: 30,
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
                                        //   width: 400,
                                        //   height: 430,
                                        //   fit: BoxFit.cover,
                                        // ),
                                        Container(
                                          width: 400,
                                          height: 430,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: MemoryImage(file!))),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.delete_outline_outlined,
                                              color: Colors.red,
                                            ))
                                      ],
                                    ),
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
                                "Add Accounts",
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
                          children: [],
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
                ? const EdgeInsets.all(8)
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
                        onPressed: () {},
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

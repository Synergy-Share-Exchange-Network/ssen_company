import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/size.dart';
import '../../utils/constants/text_string.dart';
import '../../utils/helper_function.dart';
import '../../utils/utils.dart';
import '../../widget/company detail/bank_account.dart';
import 'form_step.dart';
import 'formelement.dart';

class EditShare extends StatefulWidget {
  const EditShare({super.key});

  @override
  State<EditShare> createState() => _EditShare();
}

class _EditShare extends State<EditShare> {
  Uint8List? mainImage;
  List<Uint8List>? images;
  bool _isImageSelected = false;

  void _selectImages() async {
    List<XFile> im = await ImagePicker().pickMultiImage();
    images = await convertXFileListToUint8ListList(im);
    _isImageSelected = true;
    if (images!.length == 0) {
      _isImageSelected = false;
    }
    setState(() {});
  }

  void _selectMainImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);

    setState(() {
      mainImage = im;
    });
  }

  void _selectIndividualImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    images!.add(im);
    // need to remove duplicated item
    // _images = Set.of(_images!).toList();
    setState(() {});
  }

  void _deleteMainImage() async {
    mainImage = null;

    setState(() {});
  }

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
          'Edit Post',
          style: dark
              ? STextTheme.darkTextTheme.titleLarge
              : STextTheme.lightTextTheme.titleLarge,
        ),
        centerTitle: true,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AddMainImage(
                            // file: _images![0],
                            file: mainImage,
                            deleteCallback: () {
                              _deleteMainImage();
                            },
                            callback: () {
                              _selectMainImage();
                              // _selectImages();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
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
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddPopup();
                                },
                              );
                            },
                            child: Text('Add'),
                          ),
                          
                        ],
                      ),
                       const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      verticlScrollableBankAccount(),
                      verticlScrollableBankAccount(),
                      verticlScrollableBankAccount(),
                      verticlScrollableBankAccount(),
                      
                     
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
                        child: const Text("   Update   ")),
                const Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AddMainImage extends StatelessWidget {
  const AddMainImage({
    Key? key,
    required this.deleteCallback,
    required this.callback,
    this.file,
  }) : super(key: key);
  final VoidCallback deleteCallback;

  final VoidCallback callback;
  // final PlatformFile? file;
  final Uint8List? file;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(60),
                child: Column(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width > phoneSize)
                          ? 500
                          : MediaQuery.of(context).size.width - 150,
                      height: (MediaQuery.of(context).size.width > phoneSize)
                          ? 430
                          : MediaQuery.of(context).size.width - 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(34, 33, 149, 243), width: 2),
                        color: Colors.white,
                      ),
                      child: (file == null)
                          ? Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Center(
                                        child: Text(
                                          "Add Main Image",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Icon(
                                        Icons.add,
                                        color: Colors.blue,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                // Image.file(
                                //   File(file!.path.toString()),
                                //   width: 400,
                                //   height: 430,
                                //   fit: BoxFit.cover,
                                // ),
                                Container(
                                  width: 900,
                                  height: 830,
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

class AddPopup extends StatelessWidget {
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Bank Account'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _bankNameController,
            decoration: InputDecoration(labelText: 'Bank Name'),
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems / 2,
          ),
          TextField(
            controller: _accountNameController,
            decoration: InputDecoration(labelText: 'Account Name'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Implement add functionality here
            // For example, you can print the entered values
            print('Bank Name: ${_bankNameController.text}');

            print('Account Name: ${_accountNameController.text}');
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}

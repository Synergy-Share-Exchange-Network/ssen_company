import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/key_figure_model.dart';
import 'package:ssen_company/Models/share_model.dart';
import 'package:ssen_company/Models/testimonial_model.dart';
import 'package:ssen_company/Models/why_invest.dart';
import 'package:ssen_company/Repository/firebase/model%20methods/firebase_share_methods.dart';
import 'package:ssen_company/provider/company_provider.dart';
import 'package:ssen_company/repository/firebase/model%20methods/firebase_why_invest_methods.dart';

import '../../../Models/company_profile_model.dart';
import '../../../services/theme/text_theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/constants/text_string.dart';
import '../../../utils/helper_function.dart';
import '../../../utils/utils.dart';
import '../form_step.dart';
import '../formelement.dart';

class AddWhyInvest extends StatefulWidget {
  const AddWhyInvest({super.key});

  @override
  State<AddWhyInvest> createState() => _AddWhyInvest();
}

class _AddWhyInvest extends State<AddWhyInvest> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // KeyFigureModel c =KeyFigureModel(name: name, position: position)
  Uint8List? mainImage;
  void _selectMainImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      mainImage = im;
    });
  }

  void _deleteMainImage() async {
    mainImage = null;

    setState(() {});
  }

  void addWhyInvest(CompanyProfileModel company) async {
    WhyInvestModel whyInvest = WhyInvestModel(
        title: titleController.text.trim(),
        description: descriptionController.text.trim());
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
              Text("Adding Why invest..."),
            ],
          ),
        ),
      ),
    );
    FirebasewhyInvestMethod().create(company, whyInvest, mainImage);
    await Provider.of<UserProvider>(context, listen: false).refreshUser();

    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
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
                  'Add Why You Invest',
                  style: dark
                      ? STextTheme.darkTextTheme.titleLarge
                      : STextTheme.lightTextTheme.titleLarge,
                ),
                backgroundColor:
                    !dark ? SColors.lighGrey : SColors.homePageNavBar,

                // elevation: 1,
              ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title",
                ),
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Description",
                ),
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),
              AddMainImage(
                deleteCallback: _deleteMainImage,
                callback: _selectMainImage,
                file: mainImage,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Discard')),
                  ElevatedButton(
                      onPressed: () {
                        addWhyInvest(company);
                      },
                      child: Text('Save')),
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ));
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width > phoneSize)
                          ? 300
                          : MediaQuery.of(context).size.width - 150,
                      height: (MediaQuery.of(context).size.width > phoneSize)
                          ? 330
                          : MediaQuery.of(context).size.width - 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(34, 33, 149, 243), width: 2),
                        color: Colors.white,
                      ),
                      child: (file == null)
                          ? Container(
                              margin: const EdgeInsets.all(8),
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

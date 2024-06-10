import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:ssen_company/Models/purchase_model.dart';
import 'package:ssen_company/Repository/firebase/model%20methods/firebase_purchase_methods.dart';
import 'package:ssen_company/repository/firebase/service%20methods/firebase_purchase_service_method.dart';

import 'package:uuid/uuid.dart';

import '../../../Models/company_profile_model.dart';
import '../../../Repository/firebase/firebase_storage_methods.dart';
import '../../../services/theme/text_theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helper_function.dart';
import '../../../utils/utils.dart';

class ConfirmDoc extends StatefulWidget {
  const ConfirmDoc({super.key, required this.purchase});
  final PurchaseModel purchase;

  @override
  State<ConfirmDoc> createState() => _ConfirmDoc();
}

class _ConfirmDoc extends State<ConfirmDoc> {
  // KeyFigureModel c =KeyFigureModel(name: name, position: position)

  Uint8List? agreementImage;
  Uint8List? personalnfoImage;
  Uint8List? bankDuplicateImage;
  Uint8List? companyReceiptImage;

  void _selectagreementImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      agreementImage = im;
    });
  }

  void _deleteagreementImage() async {
    agreementImage = null;

    setState(() {});
  }

  void _selectpersonalnfoImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      personalnfoImage = im;
    });
  }

  void _deletepersonalnfoImage() async {
    personalnfoImage = null;

    setState(() {});
  }

  void _selectbankDuplicateImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      bankDuplicateImage = im;
    });
  }

  void _deletebankDuplicateImage() async {
    bankDuplicateImage = null;

    setState(() {});
  }

  void _selectcompanyReceiptImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      companyReceiptImage = im;
    });
  }

  void _deletecompanyReceiptImage() async {
    companyReceiptImage = null;

    setState(() {});
  }

  // ignore: non_constant_identifier_names
  void addDocuments(PurchaseModel purchase) async {
    // String partners = String();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Container(
          padding: const EdgeInsets.all(20),
          height: 125,
          child: Column(
            children: const [
              CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              Text("Adding Documents..."),
            ],
          ),
        ),
      ),
    );
    String photoURLWithThumbnails1 = '';
    String photoURLWithThumbnails2 = '';
    String photoURLWithThumbnails3 = '';
    String photoURLWithThumbnails4 = '';
    if (agreementImage != null) {
      String photoURL = await FirebaseStorageMethods().uploadImageToStorage(
          "logo/${purchase.identification}/image/${const Uuid().v1()}",
          agreementImage!);
      if (!kIsWeb) {
        String thumbnailsPhotoURL = await FirebaseStorageMethods()
            .uploadImageToStorageThumbnails(
                "logo/${purchase.identification}/thumbnail/${const Uuid().v1()}",
                agreementImage!);
        photoURLWithThumbnails1 = '$photoURL<thumbnail>$thumbnailsPhotoURL';
      } else {
        photoURLWithThumbnails1 = '$photoURL<thumbnail>$photoURL';
      }
      // company.logoImage = [photoURLWithThumbnails];
    }
    if (personalnfoImage != null) {
      String photoURL = await FirebaseStorageMethods().uploadImageToStorage(
          "logo/${purchase.identification}/image/${const Uuid().v1()}",
          personalnfoImage!);
      if (!kIsWeb) {
        String thumbnailsPhotoURL = await FirebaseStorageMethods()
            .uploadImageToStorageThumbnails(
                "logo/${purchase.identification}/thumbnail/${const Uuid().v1()}",
                personalnfoImage!);
        photoURLWithThumbnails2 = '$photoURL<thumbnail>$thumbnailsPhotoURL';
      } else {
        photoURLWithThumbnails2 = '$photoURL<thumbnail>$photoURL';
      }
    }
    if (bankDuplicateImage != null) {
      String photoURL = await FirebaseStorageMethods().uploadImageToStorage(
          "logo/${purchase.identification}/image/${const Uuid().v1()}",
          bankDuplicateImage!);
      if (!kIsWeb) {
        String thumbnailsPhotoURL = await FirebaseStorageMethods()
            .uploadImageToStorageThumbnails(
                "logo/${purchase.identification}/thumbnail/${const Uuid().v1()}",
                bankDuplicateImage!);
        photoURLWithThumbnails3 = '$photoURL<thumbnail>$thumbnailsPhotoURL';
      } else {
        photoURLWithThumbnails3 = '$photoURL<thumbnail>$photoURL';
      }
    }
    if (companyReceiptImage != null) {
      String photoURL = await FirebaseStorageMethods().uploadImageToStorage(
          "logo/${purchase.identification}/image/${const Uuid().v1()}",
          companyReceiptImage!);
      if (!kIsWeb) {
        String thumbnailsPhotoURL = await FirebaseStorageMethods()
            .uploadImageToStorageThumbnails(
                "logo/${purchase.identification}/thumbnail/${const Uuid().v1()}",
                companyReceiptImage!);
        photoURLWithThumbnails4 = '$photoURL<thumbnail>$thumbnailsPhotoURL';
      } else {
        photoURLWithThumbnails4 = '$photoURL<thumbnail>$photoURL';
      }
    }
    List<String> docs = purchase.finishedPDF;
    docs.add(photoURLWithThumbnails1);
    docs.add(photoURLWithThumbnails2);
    docs.add(photoURLWithThumbnails3);
    docs.add(photoURLWithThumbnails4);
    docs.removeWhere((string) => string == '');
    FirebasePurchaseMethods()
        .update(purchase.identification, 'finishedPDF', docs);

    FirebasePurchaseServiceMethod().finshPurchaseTranaction(purchase, true, '');
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  get file => null;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Enter necessary Documents to verify',
            style: dark
                ? STextTheme.darkTextTheme.titleLarge
                : STextTheme.lightTextTheme.titleLarge,
          ),
          backgroundColor: !dark ? SColors.lighGrey : SColors.homePageNavBar,

          // elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: (MediaQuery.of(context).size.width < phoneSize)
                    ? MediaQuery.of(context).size.width
                    : 500,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Agreement image ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  AddMainImage(
                    deleteCallback: _deleteagreementImage,
                    callback: _selectagreementImage,
                    file: agreementImage,
                    title: 'Agreement image',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Personal information ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  AddMainImage(
                    deleteCallback: _deletepersonalnfoImage,
                    callback: _selectpersonalnfoImage,
                    file: personalnfoImage,
                    title: 'Personal Info',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Bank Duplicate ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  AddMainImage(
                    deleteCallback: _deletebankDuplicateImage,
                    callback: _selectbankDuplicateImage,
                    file: bankDuplicateImage,
                    title: 'Bank Duplicate ',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Company reciept image 222",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  AddMainImage(
                    deleteCallback: _deletecompanyReceiptImage,
                    callback: _selectcompanyReceiptImage,
                    file: companyReceiptImage,
                    title: 'Company receipt ',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            print("5555555");
                            addDocuments(widget.purchase);
                          },
                          child: const Text(
                            'Confirm Document verification',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(6),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(34, 33, 149, 243)),
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
    required this.title,
  }) : super(key: key);
  final VoidCallback deleteCallback;
  final String title;

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
                            color: const Color.fromARGB(34, 33, 149, 243),
                            width: 2),
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
                                    children: [
                                      Center(
                                        child: Text(
                                          "Add $title",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      const Icon(
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

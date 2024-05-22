import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/Repository/firebase/service%20methods/firebase_company_service_method.dart';
import 'package:ssen_company/provider/company_provider.dart';
import 'package:ssen_company/utils/constants/size.dart';
import 'package:ssen_company/utils/utils.dart';

import '../../utils/constants.dart';

class EditImageCompanyProfile extends StatefulWidget {
  const EditImageCompanyProfile({Key? key}) : super(key: key);

  @override
  State<EditImageCompanyProfile> createState() =>
      _EditImageCompanyProfileState();
}

class _EditImageCompanyProfileState extends State<EditImageCompanyProfile> {
  @override
  Widget build(BuildContext context) {
    CompanyProfileModel company = Provider.of<UserProvider>(context).getCompany;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: SSizes.defaultSpace,
          ),
          const Text(
            "Logo Image",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          PhotoWidget(
            image: getImage(company.logoImage[0]),
            action: () async {
              Uint8List im = await pickImage(ImageSource.gallery);

              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  content: Container(
                    padding: EdgeInsets.all(20),
                    height: 130,
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Updating logo Image"),
                      ],
                    ),
                  ),
                ),
              );

              FirebaseCompanyServiceMethod().updateCompanyLOgo(
                  file: im,
                  companyId: company.identification,
                  logo: company.logoImage);
              await Provider.of<UserProvider>(context, listen: false)
                  .refreshUser();
              // setState(() {});

              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: SSizes.defaultSpace * 2,
          ),
          const Text(
            "Brand Image",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          PhotoWidget(
            image: getImage(company.brandImage[0]),
            action: () async {
              Uint8List im = await pickImage(ImageSource.gallery);

              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  content: Container(
                    padding: EdgeInsets.all(20),
                    height: 130,
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Updating Brand Image"),
                      ],
                    ),
                  ),
                ),
              );

              FirebaseCompanyServiceMethod().updateBrandImage(
                  file: im,
                  companyId: company.identification,
                  brandImage: company.brandImage);
              await Provider.of<UserProvider>(context, listen: false)
                  .refreshUser();
              // setState(() {});

              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: SSizes.defaultSpace,
          ),
          // IconButton(
          //     onPressed: () {
          //       print(company.brandImage);
          //     },
          //     icon: Icon(Icons.branding_watermark))
        ],
      ),
    ));
  }
}

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    Key? key,
    required this.image,
    required this.action,
  }) : super(key: key);

  final String image;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: (MediaQuery.of(context).size.width > phoneSize) ? 400 : 225,
        width: (MediaQuery.of(context).size.width > phoneSize) ? 400 : 225,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            (image == "")
                ? InkWell(
                    onTap: action,
                    child: Container(
                      height: (MediaQuery.of(context).size.width > phoneSize)
                          ? 400
                          : 225,
                      width: (MediaQuery.of(context).size.width > phoneSize)
                          ? 400
                          : 225,
                      // height: 250,
                      // width: 200,
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: SSizes.defaultSpace,
                          ),
                          Text(
                            "Add Image",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Material(
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                PhotoView(
                                  imageProvider: NetworkImage(image),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  child: IconButton(
                                      onPressed: () => Navigator.pop(context),
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      // height: 250,
                      // width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(image)),
                          shape: BoxShape.rectangle,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
            // Container(
            //   margin: EdgeInsets.all(8),
            //   width: 150,
            //   height: 30,
            //   decoration: BoxDecoration(
            //       color: (!isAbsent)
            //           ? const Color.fromARGB(134, 76, 175, 79)
            //           : Colors.red,
            //       borderRadius: const BorderRadius.all(Radius.circular(20))),
            //   child: Center(
            //     child: Text(
            //       (isAbsent) ? 'Absent' : clockText,
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            // )
            if ((image != ""))
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: action, child: Text("Change Image")),
              )
          ],
        ),
      ),
    );
  }
}

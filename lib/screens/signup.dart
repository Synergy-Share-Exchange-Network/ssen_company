import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/Repository/firebase/service%20methods/auth/auth_methods.dart';
import 'package:ssen_company/responsive.dart';
import 'package:ssen_company/screens/login.dart';
import 'package:ssen_company/screens/pending_request.dart';
import 'package:ssen_company/screens/state%20pages/company_profile.dart';
import 'package:ssen_company/utils/constants/colors.dart';

import '../utils/constants/size.dart';
import '../utils/constants/text_string.dart';
import '../utils/helper_function.dart';
import '../utils/utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const route = "signup";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  final companyNameController = TextEditingController();
  final phonenumberController = TextEditingController();
  Uint8List? _logo;
  Uint8List? _tradeLicense;
  Uint8List? _shareLicense;
  bool _isLoading = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    companyNameController.dispose();
    phonenumberController.dispose();

    super.dispose();
  }

  void _selectTradeLicenseImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _tradeLicense = im;
    });
  }

  void _deleteTradeLicenseImage() async {
    _tradeLicense = null;

    setState(() {});
  }

  void _selectShareLicenseImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _shareLicense = im;
    });
  }

  void _deleteShareLicenseImage() async {
    _shareLicense = null;

    setState(() {});
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _logo = im;
    });
  }

  void signUpUser() async {
    print("inside signup");
    setState(() {
      _isLoading = true;
    });
    CompanyProfileModel company = CompanyProfileModel(
        name: companyNameController.text.trim(),
        businessSector: '',
        lineOfBusiness: '',
        yearOfEstablishment: '',
        phoneNumber: phonenumberController.text.trim(),
        email: emailController.text.trim());
    // String res = await FirebaseAuthMethod().signUpUser(
    //     firstName: companyNameController.text.trim(),
    //     lastName: phonenumberController.text.trim(),
    //     password: passwordController.text,
    //     email: emailController.text.trim(),
    //     file: _logo!);
    print(company);

    String res = await AuthMethods().signUpCompany(
        company: company,
        password: passwordController.text,
        logo: _logo!,
        tradeLicense: _tradeLicense,
        shareLicense: _shareLicense);
    setState(() {
      _isLoading = false;
    });
    if (res != "success") {
      showSnackBar(res, context);
    } else {
      showSnackBar(res, context);
      Navigator.pushNamed(context, PendingRequest.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    SText.signUpTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  InkWell(
                    onTap: selectImage,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        (_logo != null)
                            ? Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white38, width: 5.0),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: MemoryImage(_logo!))),
                              )
                            : Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(95, 33, 149, 243),
                                      width: 5.0),
                                  shape: BoxShape.circle,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Center(
                                      child: Text(
                                        "Add Logo",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15,
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
                              ),
                        // Container(
                        //   decoration: const BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: Colors.white,
                        //   ),
                        //   child: IconButton(
                        //       onPressed: selectImage,
                        //       icon: const Icon(
                        //         Icons.camera,
                        //         size: 30,
                        //       )),
                        // )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwItems,
                  ),
                  Form(
                    child: Column(
                      children: [
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: TextFormField(
                        //         decoration: const InputDecoration(
                        //             prefixIcon: Icon(Iconsax.user),
                        //             labelText: SText.firstName),
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       width: SSizes.spaceBtwInputField,
                        //     ),
                        //     Expanded(
                        //       child: TextFormField(
                        //         decoration: const InputDecoration(
                        //             prefixIcon: Icon(Iconsax.user),
                        //             labelText: SText.lastName),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: SSizes.spaceBtwInputField,
                        // ),
                        TextFormField(
                          controller: companyNameController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.user_edit),
                              labelText: SText.companyName),
                        ),
                        const SizedBox(
                          height: SSizes.spaceBtwInputField,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.direct),
                              labelText: SText.email),
                        ),
                        const SizedBox(
                          height: SSizes.spaceBtwInputField,
                        ),
                        TextFormField(
                          controller: phonenumberController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.call),
                              labelText: SText.phoneNumber),
                        ),
                        const SizedBox(
                          height: SSizes.spaceBtwInputField,
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.eye_slash),
                              labelText: SText.password),
                        ),
                        const SizedBox(
                          height: SSizes.spaceBtwItems,
                        ),
                        Row(
                          children: [
                            AddMainImage(
                              // file: _images![0],
                              file: _tradeLicense,
                              deleteCallback: () {
                                _deleteTradeLicenseImage;
                              },
                              callback: () {
                                _selectTradeLicenseImage();
                                // _selectImages();
                              },
                              text: 'Add Trade License',
                            ),
                            AddMainImage(
                              // file: _images![0],
                              file: _shareLicense,
                              deleteCallback: () {
                                _deleteShareLicenseImage();
                              },
                              callback: () {
                                _selectShareLicenseImage();
                                // _selectImages();
                              },
                              text: 'Add Share License',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: SSizes.spaceBtwItems,
                        ),

                        const SizedBox(
                          height: SSizes.spaceBtwItems,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child:
                                  Checkbox(value: true, onChanged: (value) {}),
                            ),
                            const SizedBox(
                              width: SSizes.spaceBtwItems,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: SText.iAgree,
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: ' ${SText.privacy}  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                          color:
                                              dark ? Colors.white : Colors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: dark
                                              ? Colors.white
                                              : Colors.blue)),
                              TextSpan(
                                  text: 'and',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: ' ${SText.termCondition}  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                          color:
                                              dark ? Colors.white : Colors.blue,
                                          decoration: TextDecoration.underline,
                                          decorationColor: dark
                                              ? Colors.white
                                              : Colors.blue)),
                            ])),
                          ],
                        ),
                        const SizedBox(
                          height: SSizes.spaceBtwItems,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: signUpUser,
                                child: _isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          // value: 0.2,
                                        ),
                                      )
                                    : const Text("Create Account"))),
                        const SizedBox(
                          height: SSizes.spaceBtwItems,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                                child: Divider(
                              color: dark ? SColors.darkeGery : SColors.dark,
                              thickness: 0.5,
                              indent: 60,
                              endIndent: 5,
                            )),
                            const Text('Already have account '),
                            Flexible(
                                child: Divider(
                              color: dark ? SColors.darkeGery : SColors.dark,
                              thickness: 0.5,
                              indent: 5,
                              endIndent: 60,
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: SSizes.spaceBtwItems,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Login.route);
                              },
                              child: const Text(SText.signIn)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
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
    required this.text,
  }) : super(key: key);
  final VoidCallback deleteCallback;

  final VoidCallback callback;
  final String text;
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
                      width: 140,
                      height: 150,
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
                                    children: [
                                      Center(
                                        child: Text(
                                          text,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 10,
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

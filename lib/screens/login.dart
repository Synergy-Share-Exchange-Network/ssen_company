import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_company/Repository/firebase/service%20methods/auth/auth_methods.dart';
import 'package:ssen_company/screens/signup.dart';
import 'package:ssen_company/utils/constants/colors.dart';

import '../responsive.dart';
import '../utils/constants.dart';
import '../utils/constants/image_Strings.dart';
import '../utils/constants/size.dart';
import '../utils/constants/text_string.dart';
import '../utils/helper_function.dart';
import '../utils/utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static const route = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    // String res = await FirebaseAuthMethod().loginUser(
    //     email: emailController.text.trim(), password: passwordController.text);
    String res = await AuthMethods().loginUser(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });
    if (res != "Success") {
      showSnackBar(res, context);
    } else {
      showSnackBar(res, context);
      Navigator.pushNamed(context, Responsive.route);
      print("Should be logging");
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (MediaQuery.of(context).size.width > phoneSize)
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width - 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('asset/login.jpg'))),
              ),
            Container(
              width: 400,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: SSizes.appBarHeight,
                    bottom: SSizes.defaultSpace,
                    left: SSizes.defaultSpace,
                    right: SSizes.defaultSpace),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          height: 100,
                          image: AssetImage(dark
                              ? 'asset/logo_image/Synergydark.png'
                              : 'asset/logo_image/Synergylight.png'),
                        ),
                        Text(
                          // SText.loginTitle,
                          "",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: SSizes.sm,
                        ),
                        Text(
                          // SText.loginSubTitle,
                          '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: SSizes.spaceBtwSections),
                        child: Column(
                          children: [
                            TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.email, color: Colors.grey),
                                  labelText: SText.email),
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            TextFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.remove_red_eye_sharp),
                                  prefixIcon: Icon(Icons.password_outlined,
                                      color: Colors.grey),
                                  labelText: SText.password),
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField / 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: true, onChanged: (value) {}),
                                    const Text(SText.rememberMe)
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(SText.forgetPassword))
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwSections,
                            ),
                            SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: loginUser,
                                    child: (_isLoading)
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : const Text(SText.signIn))),
                            const SizedBox(
                              height: SSizes.spaceBtwItems,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUp()));
                                  },
                                  child: const Text(SText.signUp)),
                            )
                          ],
                        ),
                      ),
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
                        const Text('Or Sign With '),
                        Flexible(
                            child: Divider(
                          color: dark ? SColors.darkeGery : SColors.dark,
                          thickness: 0.5,
                          indent: 5,
                          endIndent: 60,
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/intermediate.dart';
import 'package:ssen_company/provider/company_provider.dart';

class Responsive extends StatefulWidget {
  const Responsive({super.key});
  static const route = "responsive";

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
    // SearchProvider searchProvider = Provider.of(context, listen: false);
    // await searchProvider.refreshSearch();
    Navigator.pushNamed(context, Intermediate.route);
  }

  @override
  Widget build(BuildContext context) {
    // UserModel user = Provider.of<UserProvider>(context).getUser;

    // return Scaffold(
    //     body: (user != null)
    //         ? (MediaQuery.of(context).size.width > phoneSize)
    //             ? const DesktopResponsive()
    //             : const MainPageState()
    //         : const Center(
    //             child: CircularProgressIndicator(
    //               color: Colors.orange,
    //             ),
    //           )
    //           );
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: Colors.blue,
      )),
    );
  }
}

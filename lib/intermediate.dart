import 'package:flutter/material.dart';
import 'package:ssen_company/screens/desktop_responsive.dart';
import 'package:ssen_company/utils/constants.dart';

import 'screens/state pages/main_page.dart';

class Intermediate extends StatefulWidget {
  const Intermediate({super.key});
  static const route = "intermediate";

  @override
  State<Intermediate> createState() => _IntermediateState();
}

class _IntermediateState extends State<Intermediate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (MediaQuery.of(context).size.width > phoneSize)
            ? const DesktopResponsive(indexfromCall: 0,)
            : const MainPage());
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_company/screens/partial%20screen/add_share.dart';

import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helper_function.dart';
import '../../widget/share.dart';
import '../profile_detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text('You'),
          ),
          body: PostDetail()),
    );
  }
}

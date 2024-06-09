import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/navbar.dart';
import '../../utils/helper_function.dart';
import '../../widget/shareholder_widget.dart';
import '../../widget/subscriber_widget.dart';
import '../partial screen/shareholders and subscribers/shareholders.dart';
import '../partial screen/shareholders and subscribers/subscribers.dart';

class ShareHolderPage extends StatefulWidget {
  const ShareHolderPage({super.key});

  @override
  State<ShareHolderPage> createState() => _ShareHolderPage();
}

class _ShareHolderPage extends State<ShareHolderPage> {
  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer:
            (MediaQuery.of(context).size.width > phoneSize) ? null : NavBar(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:
              dark ? SColors.darkContainer : SColors.lightContainer,

          actions: const [
            Icon(Icons.search),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.sort),
            SizedBox(
              width: 20,
            )
          ],

          bottom: TabBar(
              labelColor: dark ? SColors.white : SColors.black,
              tabs: const [
                Tab(
                  child: Text(
                    "Shareholders",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
                Tab(
                  child: Text(
                    "Subscribers",
                    style: TextStyle(
                        fontWeight: FontWeight.bold), // Make text bold
                  ),
                ),
              ]),
          // elevation: 1,
        ),
        body: TabBarView(children: [ShareHolders(), Subscribers()]),
      ),
    );
  }
}

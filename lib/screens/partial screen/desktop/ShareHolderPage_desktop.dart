import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helper_function.dart';
import '../../../widget/shareholder_widget.dart';
import '../../../widget/subscriber_widget.dart';


class ShareHolderPageDesktop extends StatefulWidget {
  const ShareHolderPageDesktop({super.key});

  @override
  State<ShareHolderPageDesktop> createState() => _ShareHolderPageDesktop();
}

class _ShareHolderPageDesktop extends State<ShareHolderPageDesktop> {
  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
           backgroundColor: dark ? SColors.darkContainer : SColors.lightContainer,
          title: Text('ShareHolders '),
          centerTitle: true,
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
            tabs: const [
              Tab(
                text: "ShareHolders",
              ),
              Tab(
                text: "Subscribers",
              ),
            ],
            labelColor: dark ? SColors.primary : SColors.dark,
            unselectedLabelColor:
                dark ? SColors.lighGrey : SColors.darkContainer,
            indicatorWeight: 4.0,
            isScrollable: true,
          ),
          // elevation: 1,
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ShareHoldersWidget(),
                ShareHoldersWidget(),
                ShareHoldersWidget(),
                ShareHoldersWidget(),
                ShareHoldersWidget(),
                ShareHoldersWidget(),
                ShareHoldersWidget(),
                ShareHoldersWidget(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SubscriberWidget(),
                SubscriberWidget(),
                SubscriberWidget(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

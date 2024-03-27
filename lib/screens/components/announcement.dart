import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/AnnouncementModel.dart';
import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helper_function.dart';
import '../../widget/announcement_widget.dart';

class Announcment extends StatelessWidget {
  const Announcment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = SHelperFunction.isDarkMode(context);
    AnnouncementModel announcement = AnnouncementModel(
        identification: "11",
        content:
            "bitcoin is blomming the social and nural netork before someoe else fount it it is coing  my name is birhan I'm writing this from bottm of my heart.",
        companyID: "companyID",
        title: "cripto is reaching 1Billion people",
        images: ["asset/logo_image/goat.jpg"]);

    return Scaffold(
      appBar: (MediaQuery.of(context).size.width > phoneSize)
          ? PreferredSize(preferredSize: Size.zero, child: AppBar())
          : AppBar(
              title: Text('Announcement'),
              centerTitle: true,
              actions: const [
                Icon(Icons.add,size: 30,),
                SizedBox(width: 20,),
                Icon(Icons.sort),

                SizedBox(
                  width: 10,
                ),
              ],
              backgroundColor:
                  (!isDark) ? SColors.lighGrey : SColors.homePageNavBar,

              // elevation: 1,
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnnouncmentWidget(
              announcement: announcement,
            ),
            AnnouncmentWidget(
              announcement: announcement,
            ),
            AnnouncmentWidget(
              announcement: announcement,
            ),
            AnnouncmentWidget(
              announcement: announcement,
            ),
            AnnouncmentWidget(
              announcement: announcement,
            ),
          ],
        ),
      ),
    );
  }
}

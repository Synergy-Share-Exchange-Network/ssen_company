import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';


import '../../Models/announcement_model.dart';
import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/navbar.dart';
import '../../utils/helper_function.dart';
import '../../widget/announcement_widget.dart';
import '../add_announcement.dart';

class Announcment extends StatelessWidget {
  const Announcment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    AnnouncementModel announcement = AnnouncementModel(
        identification: "11",
        content:
            "bitcoin is blomming the social and nural netork before someoe else fount it it is coing  my name is birhan I'm writing this from bottm of my heart.",
        companyID: "companyID",
        title: "cripto is reaching 1Billion people",
        images: ["asset/logo_image/goat.jpg"]);

    return Scaffold(
      drawer:NavBar(),
      appBar: AppBar(
             backgroundColor: dark ? SColors.darkContainer : SColors.lightContainer,
              title: Text('Announcement'),
              centerTitle: true,
              actions:  [
                GestureDetector(
                   onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AddAnnouncement()), // Replace ShareholderDetailPage() with your actual detail page
        );
      },
                  child: Icon(Icons.add,size: 30,)),
                SizedBox(width: 20,),
                Icon(Icons.sort),

                SizedBox(
                  width: 10,
                ),
              ],
           

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

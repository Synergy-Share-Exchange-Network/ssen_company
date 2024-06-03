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

class Announcment extends StatefulWidget {
  const Announcment({Key? key, required this.announcements}) : super(key: key);
  final List<AnnouncementModel> announcements;

  @override
  State<Announcment> createState() => _AnnouncmentState();
}

class _AnnouncmentState extends State<Announcment> {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    // AnnouncementModel announcement = AnnouncementModel(
    //     identification: "11",
    //     content:
    //         "bitcoin is blomming the social and nural netork before someoe else fount it it is coing  my name is birhan I'm writing this from bottm of my heart.",
    //     companyID: "companyID",
    //     title: "cripto is reaching 1Billion people",
    //     images: ["asset/logo_image/goat.jpg"]);

    return Scaffold(
      appBar: (MediaQuery.of(context).size.width > phoneSize)
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor:
                  dark ? SColors.darkContainer : SColors.lightContainer,

              centerTitle: true,
              actions: [
                GestureDetector(
                    onTap: () {
                      (MediaQuery.of(context).size.width > phoneSize)
                          ? showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    actions: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        width: (MediaQuery.of(context)
                                                    .size
                                                    .width >
                                                phoneSize)
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                600
                                            : MediaQuery.of(context).size.width,
                                        height:
                                            (MediaQuery.of(context).size.width >
                                                    phoneSize)
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .height -
                                                    150
                                                : MediaQuery.of(context)
                                                        .size
                                                        .height -
                                                    100,
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Add Announcement",
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 18),
                                                ),
                                                IconButton(
                                                    onPressed: () =>
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .pop(),
                                                    icon: const Icon(
                                                      Icons.close,
                                                      color: Colors.red,
                                                    ))
                                              ],
                                            ),
                                            const Expanded(
                                              child: AddAnnouncement(),
                                              // child: AddKeyFigure(),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddAnnouncement()));
                    },
                    child: Icon(
                      Icons.add,
                      size: 30,
                    )),
              ],

              // elevation: 1,
            )
          : AppBar(
              automaticallyImplyLeading: false,
              actions: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddAnnouncement()), // Replace ShareholderDetailPage() with your actual detail page
                      );
                    },
                    child: Icon(
                      Icons.add,
                      size: 30,
                    )),
              ],
              backgroundColor:
                  dark ? SColors.lightContainer : SColors.lightContainer,

              // elevation: 1,
            ),
      // drawer:NavBar(),
      // appBar: AppBar(
      //        backgroundColor: dark ? SColors.darkContainer : SColors.lightContainer,
      //         title: Text('Announcement'),
      //         centerTitle: true,
      //         actions:  [
      //           GestureDetector(
      //              onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             AddAnnouncement()), // Replace ShareholderDetailPage() with your actual detail page
      //   );
      // },
      //             child: Icon(Icons.add,size: 30,)),
      //           SizedBox(width: 20,),
      //           Icon(Icons.sort),

      //           SizedBox(
      //             width: 10,
      //           ),
      //         ],

      //         // elevation: 1,
      //       ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: (widget.announcements != [] || widget.announcements != [''])
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // children: [
                //   WhyYouInvestWidget(whyinvest: widget.whyInvests[0]),
                //   WhyYouInvestWidget(whyinvest: why2),
                //   WhyYouInvestWidget(whyinvest: why3),
                // ],
                children: widget.announcements
                    .map((announcment) =>
                        AnnouncmentWidget(announcement: announcment))
                    .toList(),
              )
            : Center(
                child: Text("No Announcemt To Display"),
              ),
      ),

      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       AnnouncmentWidget(
      //         announcement: announcement,
      //       ),
      //       AnnouncmentWidget(
      //         announcement: announcement,
      //       ),
      //       AnnouncmentWidget(
      //         announcement: announcement,
      //       ),
      //       AnnouncmentWidget(
      //         announcement: announcement,
      //       ),
      //       AnnouncmentWidget(
      //         announcement: announcement,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

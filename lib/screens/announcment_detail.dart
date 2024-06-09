import 'dart:ui';

// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:photo_view/photo_view.dart';
import 'package:ssen_company/screens/components/announcement.dart';
import 'package:ssen_company/utils/constants/pop_up_dialog.dart';

import '../Models/announcement_model.dart';
import '../services/theme/text_theme.dart';
import '../utils/constants.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/navbar.dart';
import '../utils/helper_function.dart';
import 'add_announcement.dart';
import 'edit_announcement.dart';

class AnnouncementDetail extends StatefulWidget {
  const AnnouncementDetail({Key? key, required this.announcement})
      : super(key: key);
  final AnnouncementModel announcement;

  @override
  State<AnnouncementDetail> createState() => _AnnouncementDetailState();
}

class _AnnouncementDetailState extends State<AnnouncementDetail> {
  @override
  int indexOfImage = 0;

  Widget build(BuildContext context) {
    List<String> imageUrls = [];

    if (widget.announcement.images != null) {
      imageUrls = widget.announcement.images!;
    }
    bool dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      drawer: MediaQuery.of(context).size.width > phoneSize ? NavBar() : null,
      appBar: AppBar(
        leading: MediaQuery.of(context).size.width >
                600 // Check screen width for desktop layout
            ? null // Render NavBar for desktop
            : IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
        backgroundColor:
            (!dark) ? SColors.lightContainer : SColors.darkContainer,
        elevation: 0,
        title: Text(
          'Announcement Detail',
          style: dark
              ? STextTheme.darkTextTheme.headlineSmall
              : STextTheme.lightTextTheme.headlineSmall,
        ),
        actions: [
          IconButton(
              onPressed: () {
                double dialogWidth =
                    MediaQuery.of(context).size.width > phoneSize ? 600 : 300;
                // AwesomeDialog(
                //   context: context,
                //   dialogType: DialogType.warning,
                //   animType: AnimType.topSlide,
                //   showCloseIcon: true,
                //   width: dialogWidth,
                //   title: 'Warning',
                //   desc: 'Are You sure',
                //  btnOkText: 'Yes', // Change button text to "Yes"
                //   btnCancelText: 'No',
                //   btnOkOnPress: () {},
                //   btnCancelOnPress: (){},
                // ).show();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              )),
        ],
      ),
      body: (MediaQuery.of(context).size.width > phoneSize)
          ? SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.announcement.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.announcement.publishDate,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              widget.announcement.postedBy,
                              style: TextStyle(fontSize: 14),
                            ),

                            // Container(
                            //   height: 400,
                            //   decoration: BoxDecoration(
                            //       image: DecorationImage(
                            //           fit: BoxFit.cover,
                            //           image:
                            //               AssetImage("asset/logo_image/goat.jpg"))),
                            // ),
                            //  ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => Material(
                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional.topEnd,
                                                children: [
                                                  PhotoView(
                                                    imageProvider: NetworkImage(
                                                        imageUrls[indexOfImage]
                                                            .split(
                                                                '<thumbnail>')[0]),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    child: IconButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        icon: const Icon(
                                                          Icons.close,
                                                          color: Colors.white,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 0),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    17, 0, 0, 0),
                                                width: 5),
                                            shape: BoxShape.rectangle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(imageUrls[
                                                        indexOfImage]
                                                    .split('<thumbnail>')[0]))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Wrap(
                                        spacing:
                                            8.0, // Horizontal spacing between children
                                        runSpacing:
                                            8.0, // Vertical spacing between lines
                                        children: imageUrls
                                            .asMap()
                                            .entries
                                            .map((entry) {
                                          return InkWell(
                                            onTap: () {
                                              print(entry.key);
                                              setState(() {
                                                indexOfImage = entry.key;
                                              });
                                            },
                                            child: Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                    color: Colors.blue,
                                                    width: (indexOfImage ==
                                                            entry.key)
                                                        ? 3
                                                        : 1),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(imageUrls[
                                                          entry.key]
                                                      .split('<thumbnail>')[0]),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.announcement.content,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    maxLines:
                                        null, // This allows the text to wrap to the next line as needed
                                    overflow: TextOverflow
                                        .visible, // Ensures that overflow is handled gracefully
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      // Expanded(
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       const SizedBox(
                      //         height: 80,
                      //       ),
                      //       const Text(
                      //         "As of my last update in January 2022, I can't provide real-time information. However, I can give you some general information about the stock market in America up to that point"
                      //         "The stock market is influenced by various factors, including economic indicators, geopolitical events, company performance, and investor sentiment. ",
                      //         style: TextStyle(fontSize: 14),
                      //       ),
                      //       const SizedBox(
                      //         height: 10,
                      //       ),
                      //       Text(
                      //         "As of my last update in January 2022, I can't provide real-time information. However, I can give you some general information about the stock market in America up to that point"
                      //         "The stock market is influenced by various factors, including economic indicators, geopolitical events, company performance, and investor sentiment. Major indices such as the S&P 500, Dow Jones Industrial Average, and NASDAQ Composite Index are often used to gauge the overall performance of the stock market.",
                      //         style: TextStyle(fontSize: 14),
                      //       ),
                      //     ],
                      //   ),
                      // )
                    ],
                  )),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        widget.announcement.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        widget.announcement.publishDate,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        widget.announcement.postedBy,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     border: Border.all(
                    //         color: const Color.fromARGB(17, 0, 0, 0),
                    //         width: 1),
                    //   ),
                    //   margin: const EdgeInsets.symmetric(
                    //       horizontal: 10, vertical: 10),
                    //   child: InkWell(
                    //     onTap: () => Navigator.pushNamed(
                    //         context, ChannelShop.route),
                    //     child: Container(
                    //       margin: const EdgeInsets.all(5),
                    //       child: Row(
                    //         children: [
                    //           Container(
                    //             width: 45,
                    //             height: 45,
                    //             decoration: BoxDecoration(
                    //                 shape: BoxShape.circle,
                    //                 image: DecorationImage(
                    //                     fit: BoxFit.cover,
                    //                     image: NetworkImage(widget
                    //                         .shopOwner.image![0]
                    //                         .split('<thumbnail>')[1]))),
                    //           ),
                    //           // const Expanded(flex: 1, child: SizedBox()),
                    //           const SizedBox(
                    //             width: 10,
                    //           ),
                    //           Column(
                    //             crossAxisAlignment:
                    //                 CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 widget.shopOwner.name,
                    //                 style: const TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                 ),
                    //               ),
                    //               Text(
                    //                 widget.shopOwner.littleDescraption!,
                    //                 style: const TextStyle(
                    //                     color:
                    //                         Color.fromARGB(120, 0, 0, 0)),
                    //               )
                    //             ],
                    //           ),
                    //           const Expanded(child: SizedBox()),
                    //           Container(
                    //             // width: 160,
                    //             // height: 40,
                    //             child: ElevatedButton(
                    //                 style: ElevatedButton.styleFrom(
                    //                     primary: Colors.orange.shade300),
                    //                 onPressed: () {},
                    //                 child: const Text("Subscribe",
                    //                     style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontWeight: FontWeight.normal,
                    //                     ))),
                    //           ),
                    //           // ElevatedButton(
                    //           //     onPressed: () {},
                    //           //     child: const Text(
                    //           //       "Subscribe",
                    //           //       style: TextStyle(
                    //           //           fontWeight: FontWeight.normal, fontSize: 22),
                    //           //     )),
                    //           // const Expanded(flex: 1, child: SizedBox()),
                    //           // const Icon(
                    //           //   Icons.more_vert,
                    //           //   size: 25,
                    //           // )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Material(
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  PhotoView(
                                    imageProvider: NetworkImage(
                                        imageUrls[indexOfImage]
                                            .split('<thumbnail>')[0]),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    child: IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        width: MediaQuery.of(context).size.width - 20,
                        height: 250,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(17, 0, 0, 0),
                                width: 5),
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(imageUrls[indexOfImage]
                                    .split('<thumbnail>')[0]))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: Wrap(
                        spacing: 8.0, // Horizontal spacing between children
                        runSpacing: 8.0, // Vertical spacing between lines
                        children: imageUrls.asMap().entries.map((entry) {
                          return InkWell(
                            onTap: () {
                              print(entry.key);
                              setState(() {
                                indexOfImage = entry.key;
                              });
                            },
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: Colors.orange,
                                    width: (indexOfImage == entry.key) ? 3 : 1),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(imageUrls[entry.key]
                                      .split('<thumbnail>')[0]),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${widget.announcement.content}',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              maxLines:
                                  null, // This allows the text to wrap to the next line as needed
                              overflow: TextOverflow
                                  .visible, // Ensures that overflow is handled gracefully
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Share price :',
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 20),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Text(
                    //       '${widget.share.unitSharePrice.toString()} Birr',
                    //       style: TextStyle(
                    //           color: Colors.blue,
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 20),
                    //     ),
                    //     //  Text(
                    //     //             '${widget.share.unitSharePrice.toString()} Birr',
                    //     //             style: TextStyle(
                    //     //                 fontWeight: FontWeight.bold,
                    //     //                 fontSize: 20),
                    //     //           ),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Number of share :',
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 20),
                    //     ),
                    //     SizedBox(
                    //       width: 10,
                    //     ),
                    //     Text(
                    //       '${widget.share.noOfShares.toString()} Shares',
                    //       style: TextStyle(
                    //           color: Colors.blue,
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 20),
                    //     ),
                    //     //  Text(
                    //     //             '${widget.share.unitSharePrice.toString()} Birr',
                    //     //             style: TextStyle(
                    //     //                 fontWeight: FontWeight.bold,
                    //     //                 fontSize: 20),
                    //     //           ),
                    //   ],
                    // ),
                  ]),
            ),
    );
  }
}

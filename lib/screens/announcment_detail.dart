
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../services/theme/text_theme.dart';
import '../utils/constants.dart';
import '../utils/helper_function.dart';
import 'add_announcement.dart';
import 'edit_announcement.dart';


class AnnouncementDetail extends StatelessWidget {
  const AnnouncementDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.grey,
              size: 20,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title:  Text(
          'Announcement Detail',
         style: dark
              ? STextTheme.darkTextTheme.headlineSmall
              : STextTheme.lightTextTheme.headlineSmall,
        ),
        actions:  [
          IconButton(
            onPressed: () {Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  EditAnnouncement()), // Replace ShareholderDetailPage() with your actual detail page
        );},
            icon: const Icon(
              Icons.edit,
              color: Colors.green,
              size: 25
            )),
             IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 25,
            )),
        ],
      ),
      body: (MediaQuery.of(context).size.width > phoneSize)
          ? Container(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const  Text(
                          "Dow jones nasdaq s and p 500 weekly preview: january cpi report takes the central stage u.s stock muted ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                       const  SizedBox(
                          height: 10,
                        ),
                      const   Text(
                          "Dec02/2023,   06:30 AM ",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                     const    SizedBox(
                          height: 8,
                        ),
                     const    Text(
                          "Posted By Mr. james R. ",
                          style: TextStyle(fontSize: 14),
                        ),
                     const    SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("asset/logo_image/goat.jpg"))),
                        ),
                      ],
                    ),
                  ),
                const   SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                   const      SizedBox(
                          height: 70,
                        ),
                        const Text(
                          "As of my last update in January 2022, I can't provide real-time information. However, I can give you some general information about the stock market in America up to that point"
                          "The stock market is influenced by various factors, including economic indicators, geopolitical events, company performance, and investor sentiment. ",
                          style: TextStyle(fontSize: 14),
                        ),
                     const    SizedBox(
                          height: 10,
                        ),
                        Text(


"As of my last update in January 2022, I can't provide real-time information. However, I can give you some general information about the stock market in America up to that point"
                          "The stock market is influenced by various factors, including economic indicators, geopolitical events, company performance, and investor sentiment. Major indices such as the S&P 500, Dow Jones Industrial Average, and NASDAQ Composite Index are often used to gauge the overall performance of the stock market.",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  )
                ],
              ))
          : SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dow jones nasdaq s and p 500 weekly preview: january cpi report takes the central stage u.s stock muted ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        "Dec02/2023,   06:30 AM ",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: Text(
                        "Posted By Mr. james R. ",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("asset/logo_image/goat.jpg"))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        "As of my last update in January 2022, I can't provide real-time information. However, I can give you some general information about the stock market in America up to that point"
                        "The stock market is influenced by various factors, including economic indicators, geopolitical events, company performance, and investor sentiment. ",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        "As of my last update in January 2022, I can't provide real-time information. However, I can give you some general information about the stock market in America up to that point"
                        "The stock market is influenced by various factors, including economic indicators, geopolitical events, company performance, and investor sentiment. Major indices such as the S&P 500, Dow Jones Industrial Average, and NASDAQ Composite Index are often used to gauge the overall performance of the stock market.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
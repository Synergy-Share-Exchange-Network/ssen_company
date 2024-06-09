import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/Models/announcement_model.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/Models/share_model.dart';
import 'package:ssen_company/screens/components/announcement.dart';
import 'package:ssen_company/utils/constants/colors.dart';

import '../../Repository/firebase/key words/collection_name.dart';
import '../../provider/company_provider.dart';
import '../../services/theme/text_theme.dart';
import '../../utils/constants.dart';
import '../../utils/constants/navbar.dart';
import '../../utils/helper_function.dart';

import '../../widget/request_widget.dart';
import '../../widget/secondary_request_widget.dart';
import '../components/company_profile_home.dart';
import '../components/company_profile_news.dart';
import '../components/company_profile_overview.dart';
import '../partial screen/add_share.dart';
import '../share.dart';
import '../share_page.dart';
import '../state pages/company_profile.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    CompanyProfileModel company = Provider.of<UserProvider>(context).getCompany;

    return DefaultTabController(
      length: 2,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(CollectionName.announcement)
              .orderBy('publishDate', descending: true)
              .where('companyID', isEqualTo: company.identification)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            List<AnnouncementModel> annaouncements =
                snapshot.data!.docs.map((document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return AnnouncementModel.fromMap(data);
            }).toList();
            return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection(CollectionName.share)
                    .doc((company.shareID != "")
                        ? company.shareID
                        : "20240606-2307-8f00-9753-5a6a69dd68b9")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    ); // Loading indicator while data is loading.
                  }
                  print("fffffffffffffffffffffffffffffff");
                  print(snapshot.data?.data());
                  ShareModel share = ShareModel.fromMap(
                      snapshot.data?.data() as Map<String, dynamic>);
                  print(share);
                  // ShareModel share = ShareModel(
                  //     savingAccountPercentage: 0.0,
                  //     proclamationNumber: 'proclamationNumber');

                  return Scaffold(
                    drawer: (MediaQuery.of(context).size.width > phoneSize)
                        ? null
                        : NavBar(),
                    appBar: (MediaQuery.of(context).size.width > phoneSize)
                        ? AppBar(
                            automaticallyImplyLeading:
                                (MediaQuery.of(context).size.width < phoneSize),
                            backgroundColor: dark
                                ? SColors.darkContainer
                                : SColors.lightContainer,
                            bottom: TabBar(
                                labelColor:
                                    dark ? SColors.white : SColors.black,
                                tabs: const [
                                  Tab(
                                    child: Text(
                                      "Share",
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .bold), // Make text bold
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Announcement",
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .bold), // Make text bold
                                    ),
                                  ),
                                ]),
                          )
                        : AppBar(
                            title: Text(
                              company.name,
                              style: dark
                                  ? STextTheme.darkTextTheme.headlineMedium!
                                      .copyWith(fontSize: 17)
                                  : STextTheme.lightTextTheme.headlineLarge!
                                      .copyWith(fontSize: 17),
                            ),
                            // automaticallyImplyLeading: false,
                            actions: [
                              // Icon(Iconsax.notification),
                              // SizedBox(
                              //   width: 10,
                              // ),
                              // Icon(Iconsax.search_normal),

                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Companyprofile.route);
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.blue, width: 1),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              company.logoImage[0]))),
                                ),
                              ),
                            ],
                            backgroundColor: dark
                                ? SColors.darkContainer
                                : SColors.lightContainer,
                            bottom: TabBar(
                                labelColor:
                                    dark ? SColors.white : SColors.black,
                                tabs: const [
                                  Tab(
                                    child: Text(
                                      "Share",
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .bold), // Make text bold
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Announcement",
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .bold), // Make text bold
                                    ),
                                  ),
                                ]),
                          ),
                    body: (TabBarView(children: [
                      (company.shareID == '')
                          ? Center(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    (MediaQuery.of(context).size.width >
                                            phoneSize)
                                        ? showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  actions: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      width: (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width >
                                                              phoneSize)
                                                          ? MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              70.0
                                                          : MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                      height: (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width >
                                                              phoneSize)
                                                          ? MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height -
                                                              80.0
                                                          : MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height -
                                                              100.0,
                                                      color: Colors.white,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              const Text(
                                                                "Add Share",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                              IconButton(
                                                                  onPressed: () => Navigator.of(
                                                                          context,
                                                                          rootNavigator:
                                                                              true)
                                                                      .pop(),
                                                                  icon:
                                                                      const Icon(
                                                                    Icons.close,
                                                                    color: Colors
                                                                        .red,
                                                                  ))
                                                            ],
                                                          ),
                                                          const Expanded(
                                                            child: AddPost(),
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
                                                    const AddPost()));
                                  },
                                  child: Text("Add Share")),
                            )
                          : SharePage(
                              share: share,
                            ),
                      Announcment(
                        announcements: annaouncements,
                      ),
                    ])),
                  );
                });
          }),
    );
  }
}

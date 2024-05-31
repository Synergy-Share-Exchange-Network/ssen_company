// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/screens/components/home.dart';

import 'package:ssen_company/screens/setting.dart';
import 'package:ssen_company/screens/share.dart';
import 'package:ssen_company/screens/state%20pages/company_profile.dart';
import 'package:ssen_company/screens/state%20pages/edit_company_profile.dart';
import 'package:ssen_company/screens/state%20pages/process.dart';
import 'package:ssen_company/screens/state%20pages/request_page.dart';
import 'package:ssen_company/screens/state%20pages/shareholders_subscribers.dart';
import 'package:ssen_company/screens/terms%20and%20condition.dart';
import 'package:ssen_company/utils/utils.dart';

import '../Models/company_profile_model.dart';
import '../provider/company_provider.dart';
import '../services/theme/text_theme.dart';
import '../utils/constants.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/image_Strings.dart';
import '../utils/helper_function.dart';
import 'about.dart';
import 'components/analysis.dart';
import 'components/announcement.dart';
import 'login.dart';

class DesktopResponsive extends StatefulWidget {
  const DesktopResponsive({super.key, required this.indexfromCall});
  final int indexfromCall;

  @override
  State<DesktopResponsive> createState() => _DesktopResponsiveState();
}

class _DesktopResponsiveState extends State<DesktopResponsive> {
  late int index;
  bool drawer = true;

  @override
  void initState() {
    super.initState();
    index = widget.indexfromCall;
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    CompanyProfileModel company = Provider.of<UserProvider>(context).getCompany;

    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      key: _scaffoldKey,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > tabletSize)
            Visibility(
              visible: drawer,
              child: Container(
                // margin: const EdgeInsets.all(15),
                child: Drawer(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(height: 10),
                          // const Align(
                          //     alignment: Alignment.centerLeft,
                          //     child: Text(
                          //       "Wubet Ayalew",
                          //       style: TextStyle(fontWeight: FontWeight.bold),
                          //     )),
                          Center(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  index = 5;
                                });
                              },
                              child: Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.blue, width: 3),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            getImage(company.logoImage[0])))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 5;
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      company.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(company.email)
                                  ],
                                )),
                          ),
                          const Divider(),
                          index != 0
                              ? DrawerItem(
                                  icon: Icons.account_balance_rounded,
                                  title: "Post",
                                  callback: () {
                                    setState(() {
                                      index = 0;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.account_balance_rounded,
                                  title: "Post",
                                  callback: () {
                                    setState(() {
                                      index = 0;
                                    });
                                  },
                                ),
                          index != 1
                              ? DrawerItem(
                                  icon: Icons.list_alt_rounded,
                                  title: "Subscriber",
                                  callback: () {
                                    setState(() {
                                      index = 1;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.list_alt_rounded,
                                  title: "Subscriber",
                                  callback: () {
                                    setState(() {
                                      index = 1;
                                    });
                                  },
                                ),
                          index != 2
                              ? DrawerItem(
                                  icon: Icons.insights_rounded,
                                  title: "Analytics",
                                  callback: () {
                                    setState(() {
                                      index = 2;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.insights_rounded,
                                  title: "Analytics",
                                  callback: () {
                                    setState(() {
                                      index = 2;
                                    });
                                  },
                                ),
                          index != 3
                              ? DrawerItem(
                                  icon: Icons.newspaper_rounded,
                                  title: "Process",
                                  callback: () {
                                    setState(() {
                                      index = 3;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.newspaper_rounded,
                                  title: "Process",
                                  callback: () {
                                    setState(() {
                                      index = 3;
                                    });
                                  },
                                ),
                          index != 4
                              ? DrawerItem(
                                  icon: Icons.list_alt_rounded,
                                  title: "Request",
                                  callback: () {
                                    setState(() {
                                      index = 4;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.list_alt_rounded,
                                  title: "Request",
                                  callback: () {
                                    setState(() {
                                      index = 4;
                                    });
                                  },
                                ),
                          const Divider(),
                          index != 5
                              ? DrawerItem(
                                  icon: Icons.person,
                                  title: "Profile",
                                  callback: () {
                                    setState(() {
                                      index = 5;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.person,
                                  title: "Profile",
                                  callback: () {
                                    setState(() {
                                      index = 5;
                                    });
                                  },
                                ),
                          index != 6
                              ? DrawerItem(
                                  icon: Icons.location_on,
                                  title: "Edit Profile",
                                  callback: () {
                                    setState(() {
                                      index = 6;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.location_on,
                                  title: "Edit Profile",
                                  callback: () {
                                    setState(() {
                                      index = 6;
                                    });
                                  },
                                ),
                          index != 7
                              ? DrawerItem(
                                  icon: Icons.info,
                                  title: "About Us",
                                  callback: () {
                                    Navigator.pushNamed(context, AboutUs.route);
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.info,
                                  title: "About Us",
                                  callback: () {
                                    Navigator.pushNamed(context, AboutUs.route);
                                  },
                                ),
                          // index != 8
                          DrawerItem(
                            icon: Icons.logout,
                            title: "Log Out",
                            callback: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Log out"),
                                  content: const Text(
                                      "Are You sure you want to log out?"),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Container(
                                            // color: Colors.green,
                                            padding: const EdgeInsets.all(14),
                                            child: const Text("Cancel"),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            FirebaseAuth.instance.signOut();
                                            Navigator.pushReplacementNamed(
                                                context, Login.route);
                                          },
                                          child: Container(
                                            // color: Colors.green,
                                            padding: const EdgeInsets.all(14),
                                            child: const Text("Okay"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                              // double dialogWidth =
                              //     MediaQuery.of(context).size.width > phoneSize
                              //         ? 600
                              //         : 300;
                              // AwesomeDialog(
                              //   context: context,
                              //   dialogType: DialogType.warning,
                              //   animType: AnimType.topSlide,
                              //   showCloseIcon: true,
                              //   width: dialogWidth,
                              //   title: 'Warning',
                              //   desc: 'Are YOu sure !',
                              //   btnOkText:
                              //       'Yes', // Change button text to "Yes"
                              //   btnCancelText: 'No',
                              //   btnOkOnPress: () {},
                              //   btnCancelOnPress: () {},
                              // ).show();
                            },
                          ),
                          // : SelectedDrawerItem(
                          //     icon: Icons.logout,
                          //     title: "Log Out",
                          //     callback: () {},
                          //   ),
                          // index != 9
                          // ?
                          DrawerItem(
                            icon: Icons.exit_to_app,
                            title: "Exit",
                            callback: () {
                              if (MediaQuery.of(context).size.width >
                                  tabletSize) {
                                setState(() {
                                  if (drawer) {
                                    drawer = false;
                                  } else {
                                    drawer = true;
                                  }
                                });
                              }
                              if (MediaQuery.of(context).size.width <
                                  tabletSize) {
                                _scaffoldKey.currentState?.openDrawer();
                              }
                            },
                          ),
                          // : SelectedDrawerItem(
                          //     icon: Icons.exit_to_app,
                          //     title: "Exit",
                          //     callback: () {
                          //       setState(() {
                          //         index = 9;
                          //       });
                          //     },
                          //   ),
                          const Divider(),
                          index != 10
                              ? DrawerItem(
                                  icon: Icons.settings,
                                  title: "Settings",
                                  callback: () {
                                    Navigator.pushNamed(context, Setting.route);
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.settings,
                                  title: "Settings",
                                  callback: () {
                                    Navigator.pushNamed(context, Setting.route);
                                  },
                                ),
                          index != 11
                              ? DrawerItem(
                                  icon: Icons.format_align_center,
                                  title: "Terms and Condition",
                                  callback: () {
                                    // setState(() {
                                    //   index = 11;
                                    // });
                                    Navigator.pushNamed(
                                        context, TermsAndConditionsPage.route);
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.format_align_center,
                                  title: "Terms and Condition",
                                  callback: () {
                                    // setState(() {
                                    //   index = 11;
                                    // });
                                    Navigator.pushNamed(
                                        context, TermsAndConditionsPage.route);
                                  },
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (MediaQuery.of(context).size.width > tabletSize) {
                          setState(() {
                            if (drawer) {
                              drawer = false;
                            } else {
                              drawer = true;
                            }
                          });
                        }
                        if (MediaQuery.of(context).size.width < tabletSize) {
                          _scaffoldKey.currentState?.openDrawer();
                        }
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.blue,
                        // size: 50,
                      ),
                    ),
                    Text(
                      'Synergy Stock Exchange ',
                      style: dark
                          ? STextTheme.darkTextTheme.headlineMedium
                          : STextTheme.lightTextTheme.headlineSmall,
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(company.logoImage[0]))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: SizedBox()),
                      // (MediaQuery.of(context).size.width > phoneSize)
                      //     ?
                      Container(
                        width: (drawer)
                            ? (MediaQuery.of(context).size.width - 550)
                            : MediaQuery.of(context).size.width - 225,
                        height: MediaQuery.of(context).size.height,
                        child: IndexedStack(
                          index: index,
                          children: const [
                            // const InvestmentDesktop(),
                            // const SubscribedDesktop(),
                            // const AnalyticsDesktop(),
                            // const AnnouncementsDesktop(),
                            // const OrderDesktop(),
                            // const ProfilePageState(),
                            // Location()
                            Home(),
                            ShareHolderPage(),
                            Anlaytics(),
                            ProcessPage(),
                            RequestPage(),
                            Companyprofile(),
                            EditCompanyProfile(),

                            // Center(child: Text("5")),
                            // UserProfile()
                            // TermAndCondition(),

                            // Container(),
                            // Container(),
                          ],
                        ),
                      )
                      // : Container(
                      //     width: MediaQuery.of(context).size.width,
                      //     height: MediaQuery.of(context).size.height,
                      //     child: IndexedStack(
                      //       index: index,
                      //       children: [
                      //         Container(),
                      //         Container(),
                      //         Container(),
                      //         Container(),
                      //         Container(),
                      //         Container(),
                      //         Container(),
                      //       ],
                      //     ),
                      //   )
                      ,
                      const Expanded(
                        child: SizedBox(),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: Card(
                                elevation: 2,
                                child: Container(
                                  width: 200,
                                  height: 300,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.all(15),
                                            child: const Text(
                                              "Explore",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blue),
                                            )),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            children: [
                                              const ExploreElement(
                                                icon: Icons.trending_up,
                                                title: "Competitor  ",
                                              ),
                                              const ExploreElement(
                                                icon: Icons.sports_baseball,
                                                title: "Sport Product",
                                              ),
                                              const ExploreElement(
                                                icon: Icons.construction,
                                                title: "Constraction",
                                              ),
                                              const ExploreElement(
                                                icon: Icons.smartphone_sharp,
                                                title: "Smart Phone",
                                              ),
                                              const ExploreElement(
                                                icon: Icons.laptop,
                                                title: "Laptop",
                                              ),
                                              const ExploreElement(
                                                icon: Icons
                                                    .account_balance_rounded,
                                                title: "House",
                                              ),
                                              TextButton(
                                                  onPressed: () {},
                                                  child: const Text('See More'))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExploreElement extends StatelessWidget {
  const ExploreElement({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(title)
        ],
      ),
    );
  }
}

class SubscribedChannel extends StatelessWidget {
  const SubscribedChannel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1),
                shape: BoxShape.circle,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(SImages.lightAppLogo))),
          ),
          // const Expanded(flex: 1, child: SizedBox()),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            width: 150,
            child: Text(
              "Abebe shop jk",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubscribedChannelSmall extends StatelessWidget {
  const SubscribedChannelSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1),
                shape: BoxShape.circle,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(SImages.lightAppLogo))),
          ),
          // const Expanded(flex: 1, child: SizedBox()),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            width: 100,
            child: Text(
              "Abebe shop jk",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.callback,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(icon, color: SColors.grey),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: SColors.darkeGery,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class SelectedDrawerItem extends StatelessWidget {
  const SelectedDrawerItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.callback,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        // decoration: BoxDecoration(
        //     color: Colors.blue.shade50,
        //     borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(icon, color: Colors.blue),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),

                    // VerticalDivider(
                    //   width: 10,
                    //   color: Colors.blue,
                    // )
                  ],
                ),
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

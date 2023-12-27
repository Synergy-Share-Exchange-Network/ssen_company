import 'package:flutter/material.dart';
import 'package:ssen_company/utils/constants.dart';
import 'package:ssen_company/utils/constants/colors.dart';
import 'package:ssen_company/utils/constants/image_Strings.dart';
import 'package:ssen_company/utils/helper_function.dart';

class DesktopResponsive extends StatefulWidget {
  const DesktopResponsive({super.key});

  @override
  State<DesktopResponsive> createState() => _DesktopResponsiveState();
}

class _DesktopResponsiveState extends State<DesktopResponsive> {
  int index = 0;
  bool drawer = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
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
                const SizedBox(
                  height: 20,
                ),

                Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        index = 5;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 3),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(SImages.lightAppLogo))),
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
                      Navigator.pop(context);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Wubet ayalew',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("wubetayalew@gmail.com")
                      ],
                    ),
                  ),
                ),
                const Divider(),
                index != 0
                    ? DrawerItem(
                        icon: Icons.post_add_outlined,
                        title: "Shares",
                        callback: () {
                          setState(() {
                            index = 0;
                          });
                          Navigator.pop(context);
                        },
                      )
                    : SelectedDrawerItem(
                        icon: Icons.post_add_outlined,
                        title: "Shares",
                        callback: () {
                          setState(() {
                            index = 0;
                          });
                          Navigator.pop(context);
                        },
                      ),
                index != 1
                    ? DrawerItem(
                        icon: Icons.list_alt_rounded,
                        title: "Subscribers",
                        callback: () {
                          setState(() {
                            index = 1;
                          });
                          Navigator.pop(context);
                        },
                      )
                    : SelectedDrawerItem(
                        icon: Icons.list_alt_rounded,
                        title: "Subscribers",
                        callback: () {
                          setState(() {
                            index = 1;
                          });
                          Navigator.pop(context);
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
                          Navigator.pop(context);
                        },
                      )
                    : SelectedDrawerItem(
                        icon: Icons.insights_rounded,
                        title: "Analytics",
                        callback: () {
                          setState(() {
                            index = 2;
                          });
                          Navigator.pop(context);
                        },
                      ),
                index != 3
                    ? DrawerItem(
                        icon: Icons.newspaper_rounded,
                        title: "Announcements",
                        callback: () {
                          setState(() {
                            index = 3;
                          });
                          Navigator.pop(context);
                        },
                      )
                    : SelectedDrawerItem(
                        icon: Icons.newspaper_rounded,
                        title: "Announcements",
                        callback: () {
                          setState(() {
                            index = 3;
                          });
                          Navigator.pop(context);
                        },
                      ),
                index != 4
                    ? DrawerItem(
                        icon: Icons.list_alt_rounded,
                        title: "Profile",
                        callback: () {
                          setState(() {
                            index = 4;
                          });
                          Navigator.pop(context);
                        },
                      )
                    : SelectedDrawerItem(
                        icon: Icons.list_alt_rounded,
                        title: "Profile",
                        callback: () {
                          setState(() {
                            index = 4;
                          });
                          Navigator.pop(context);
                        },
                      ),
                const Divider(),
                index != 5
                    ? DrawerItem(
                        icon: Icons.person,
                        title: "Edit Profile",
                        callback: () {
                          setState(() {
                            index = 5;
                          });
                          Navigator.pop(context);
                        },
                      )
                    : SelectedDrawerItem(
                        icon: Icons.person,
                        title: "Edit Profile",
                        callback: () {
                          setState(() {
                            index = 5;
                          });
                          Navigator.pop(context);
                        },
                      ),
                index != 6
                    ? DrawerItem(
                        icon: Icons.location_on,
                        title: "My Address",
                        callback: () {
                          setState(() {
                            index = 6;
                          });
                          Navigator.pop(context);
                        },
                      )
                    : SelectedDrawerItem(
                        icon: Icons.location_on,
                        title: "My Address",
                        callback: () {
                          setState(() {
                            index = 6;
                          });
                          Navigator.pop(context);
                        },
                      ),
                index != 7
                    ? DrawerItem(
                        icon: Icons.info,
                        title: "About Us",
                        callback: () {
                          // setState(() {
                          //   index = 7;
                          // });
                          Navigator.pop(context);
                          // Navigator.pushNamed(context, AboutUs.route);
                        },
                      )
                    : SelectedDrawerItem(
                        icon: Icons.info,
                        title: "About Us",
                        callback: () {
                          // setState(() {
                          //   index = 7;
                          // });
                          Navigator.pop(context);
                          // Navigator.pushNamed(context, AboutUs.route);
                        },
                      ),
                index != 8
                    ? DrawerItem(
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
                                        // FirebaseAuth.instance.signOut();
                                        // Navigator.pushReplacementNamed(
                                        //     context, Login.route);
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
                        },
                      )
                    : SelectedDrawerItem(
                        icon: Icons.logout,
                        title: "Log Out",
                        callback: () {},
                      ),
                index != 9
                    ? DrawerItem(
                        icon: Icons.exit_to_app,
                        title: "Exit",
                        callback: () {
                          setState(() {
                            index = 9;
                          });
                          Navigator.pop(context);
                        },
                      )
                    : SelectedDrawerItem(
                        icon: Icons.exit_to_app,
                        title: "Exit",
                        callback: () {
                          setState(() {
                            index = 9;
                          });
                          Navigator.pop(context);
                        },
                      ),
                const Divider(),
                index != 10
                    ? DrawerItem(
                        icon: Icons.settings,
                        title: "Settings",
                        callback: () {
                          Navigator.pop(context);
                          // Navigator.pushNamed(context, Setting.route);
                        },
                      )
                    : SelectedDrawerItem(
                        icon: Icons.settings,
                        title: "Settings",
                        callback: () {
                          Navigator.pop(context);
                          // Navigator.pushNamed(context, Setting.route);
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

                          Navigator.pop(context);
                          // Navigator.pushNamed(
                          //     context, TermAndCondition.route);
                        },
                      )
                    : SelectedDrawerItem(
                        icon: Icons.format_align_center,
                        title: "Terms and Condition",
                        callback: () {
                          // setState(() {
                          //   index = 11;
                          // });
                          Navigator.pop(context);
                          // Navigator.pushNamed(
                          // context, TermAndCondition.route);
                        },
                      ),
                const Divider(),
                Container(
                    margin: const EdgeInsets.all(15),
                    child: const Text(
                      "Subscribers Channals",
                      style: TextStyle(
                          fontSize: 18, color: Color.fromARGB(123, 0, 0, 0)),
                    )),
                SubscribersChannel(),
                SubscribersChannel(),
                SubscribersChannel(),
                SubscribersChannel(),
                SubscribersChannel(),
                SubscribersChannel(),
                SubscribersChannel(),
              ],
            ),
          ),
        ),
      ),
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
                                            SImages.lightAppLogo))),
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
                                  children: const [
                                    Text(
                                      'Wubet ayalew',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("wubetayalew@gmail.com")
                                  ],
                                )),
                          ),
                          const Divider(),
                          index != 0
                              ? DrawerItem(
                                  icon: Icons.post_add_outlined,
                                  title: "Shares",
                                  callback: () {
                                    setState(() {
                                      index = 0;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.post_add_outlined,
                                  title: "Shares",
                                  callback: () {
                                    setState(() {
                                      index = 0;
                                    });
                                  },
                                ),
                          index != 1
                              ? DrawerItem(
                                  icon: Icons.list_alt_rounded,
                                  title: "Subscribers",
                                  callback: () {
                                    setState(() {
                                      index = 1;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.list_alt_rounded,
                                  title: "Subscribers",
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
                                  title: "Announcements",
                                  callback: () {
                                    setState(() {
                                      index = 3;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.newspaper_rounded,
                                  title: "Announcements",
                                  callback: () {
                                    setState(() {
                                      index = 3;
                                    });
                                  },
                                ),
                          index != 4
                              ? DrawerItem(
                                  icon: Icons.list_alt_rounded,
                                  title: "Profile",
                                  callback: () {
                                    setState(() {
                                      index = 4;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.list_alt_rounded,
                                  title: "Profile",
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
                                  title: "Edit Profile",
                                  callback: () {
                                    setState(() {
                                      index = 5;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.person,
                                  title: "Edit Profile",
                                  callback: () {
                                    setState(() {
                                      index = 5;
                                    });
                                  },
                                ),
                          index != 6
                              ? DrawerItem(
                                  icon: Icons.location_on,
                                  title: "My Address",
                                  callback: () {
                                    setState(() {
                                      index = 6;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.location_on,
                                  title: "My Address",
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
                                    // setState(() {
                                    //   index = 7;
                                    // });
                                    // Navigator.pushNamed(
                                    //     context, AboutUs.route);
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.info,
                                  title: "About Us",
                                  callback: () {
                                    // setState(() {
                                    //   index = 7;
                                    // });
                                    // Navigator.pushNamed(
                                    //     context, AboutUs.route);
                                  },
                                ),
                          index != 8
                              ? DrawerItem(
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
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  child: const Text("Cancel"),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  // FirebaseAuth.instance
                                                  //     .signOut();
                                                  // Navigator
                                                  //     .pushReplacementNamed(
                                                  //         context,
                                                  //         Login.route);
                                                },
                                                child: Container(
                                                  // color: Colors.green,
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  child: const Text("Okay"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.logout,
                                  title: "Log Out",
                                  callback: () {},
                                ),
                          index != 9
                              ? DrawerItem(
                                  icon: Icons.exit_to_app,
                                  title: "Exit",
                                  callback: () {
                                    setState(() {
                                      index = 9;
                                    });
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.exit_to_app,
                                  title: "Exit",
                                  callback: () {
                                    setState(() {
                                      index = 9;
                                    });
                                  },
                                ),
                          const Divider(),
                          index != 10
                              ? DrawerItem(
                                  icon: Icons.settings,
                                  title: "Settings",
                                  callback: () {
                                    // Navigator.pushNamed(
                                    //     context, Setting.route);
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.settings,
                                  title: "Settings",
                                  callback: () {
                                    // Navigator.pushNamed(
                                    //     context, Setting.route);
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
                                    // Navigator.pushNamed(
                                    //     context, TermAndCondition.route);
                                  },
                                )
                              : SelectedDrawerItem(
                                  icon: Icons.format_align_center,
                                  title: "Terms and Condition",
                                  callback: () {
                                    // setState(() {
                                    //   index = 11;
                                    // });
                                    // Navigator.pushNamed(
                                    //     context, TermAndCondition.route);
                                  },
                                ),
                          const Divider(),
                          Container(
                              margin: const EdgeInsets.all(15),
                              child: const Text(
                                "Subscribers Channals",
                                style: TextStyle(
                                    fontSize: 18, color: SColors.grey),
                              )),
                          SubscribersChannel(),
                          SubscribersChannel(),
                          SubscribersChannel(),
                          SubscribersChannel(),
                          SubscribersChannel(),
                          SubscribersChannel(),
                          SubscribersChannel(),
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
                    const Text(
                      'Synergy Stock Exchange',
                      style: TextStyle(
                          // fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.none),
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
                              image: NetworkImage(SImages.lightAppLogo))),
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
                      (MediaQuery.of(context).size.width > phoneSize)
                          ? Container(
                              width: (drawer)
                                  ? 690
                                  : MediaQuery.of(context).size.width - 225,
                              height: MediaQuery.of(context).size.height,
                              child: IndexedStack(
                                index: index,
                                children: [
                                  // const SharesDesktop(),
                                  // const SubscribersDesktop(),
                                  // const AnalyticsDesktop(),
                                  // const AnnouncementsDesktop(),
                                  // const OrderDesktop(),
                                  // const ProfilePageState(),
                                  // Location()

                                  Center(child: Text("1")),
                                  Center(child: Text("2")),
                                  Center(child: Text("3")),
                                  Center(child: Text("4")),

                                  Center(child: Text("5")),

                                  Container(),
                                  Container(),
                                ],
                              ),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: IndexedStack(
                                index: index,
                                children: [
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(),
                                  Container(),
                                ],
                              ),
                            ),
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
                                                title: "Trending Product ",
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
                                                icon: Icons.post_add_outlined,
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
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: Card(
                                elevation: 2,
                                child: Container(
                                  width: 200,
                                  height: 300,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.all(15),
                                            child: const Text(
                                              "Recomanded Channals",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: SColors.grey),
                                            )),
                                        SubscribersChannelSmall(),
                                        SubscribersChannelSmall(),
                                        SubscribersChannelSmall(),
                                        SubscribersChannelSmall(),
                                        SubscribersChannelSmall(),
                                        SubscribersChannelSmall(),
                                        SubscribersChannelSmall(),
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

class SubscribersChannel extends StatelessWidget {
  const SubscribersChannel({
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

class SubscribersChannelSmall extends StatelessWidget {
  const SubscribersChannelSmall({
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
    final dark = SHelperFunction.isDarkMode(context);

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
              Icon(icon, color: (dark) ? SColors.grey : SColors.darkeGery),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 12,
                    color: (dark) ? SColors.lighGrey : SColors.darkerGery,
                    fontWeight: FontWeight.bold),
                // style: STextTheme.darkTextTheme.bodyLarge,
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

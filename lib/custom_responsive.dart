// import 'package:flutter/material.dart';
// import 'package:ssen_company/screens/announcment_detail.dart';
// import 'package:ssen_company/screens/desktop_responsive.dart';
// import 'package:ssen_company/screens/partial%20screen/desktop/ShareHolderPage_desktop.dart';
// import 'package:ssen_company/screens/partial%20screen/desktop/anlaytics_desktop.dart';
// import 'package:ssen_company/screens/partial%20screen/desktop/announcement_desktop.dart';
// import 'package:ssen_company/screens/partial%20screen/desktop/request_desktop.dart';
// import 'package:ssen_company/screens/partial%20screen/desktop/share_desktop.dart';
// import 'package:ssen_company/screens/share.dart';
// import 'package:ssen_company/screens/state%20pages/request_page.dart';
// import 'package:ssen_company/screens/state%20pages/share_holder_share_info.dart';


// import '../utils/constants.dart';
// import '../utils/constants/colors.dart';
// import '../utils/constants/image_Strings.dart';


// class CustomDesktopResponsive extends StatefulWidget {
//   const CustomDesktopResponsive({super.key, required this.indexfromCall, required this.widget});
//   final int indexfromCall;
//    final Widget widget;
  
  

//   @override
//   State<CustomDesktopResponsive> createState() => _CustomDesktopResponsiveState();
// }

// class _CustomDesktopResponsiveState extends State<CustomDesktopResponsive> {

//     late int index=widget.indexfromCall;
//   bool drawer = true;

//   @override
  
 
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: Drawer(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // const SizedBox(height: 10),
//                 // const Align(
//                 //     alignment: Alignment.centerLeft,
//                 //     child: Text(
//                 //       "Wubet Ayalew",
//                 //       style: TextStyle(fontWeight: FontWeight.bold),
//                 //     )),
//                 const SizedBox(
//                   height: 20,
//                 ),

//                 Center(
//                   child: InkWell(
//                     onTap: () {
//                       // setState(() {
//                       //   index = 5;
//                       // });
//                       // Navigator.pop(context);
//                        Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => DesktopResponsive(indexfromCall: 4)),
//             );
//                     },
//                     child: Container(
//                       width: 130,
//                       height: 130,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.blue, width: 3),
//                           image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: NetworkImage(SImages.lightAppLogo))),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Center(
//                   child: InkWell(
//                     onTap: () {
//                             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => DesktopResponsive(indexfromCall: 4)),
//             );
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Wubet ayalew',
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text("wubetayalew@gmail.com")
//                       ],
//                     ),
//                   ),
//                 ),
//                 const Divider(),
//                 index != 0
//                     ? DrawerItem(
//                         icon: Icons.account_balance_rounded,
//                         title: "Investment",
//                         callback: () {
//                           setState(() {
//                             index = 0;
//                           });
//                           Navigator.pop(context);
//                         },
//                       )
//                     : SelectedDrawerItem(
//                         icon: Icons.account_balance_rounded,
//                         title: "Investment",
//                         callback: () {
//                           setState(() {
//                             index = 0;
//                           });
//                           Navigator.pop(context);
//                         },
//                       ),
//                 index != 1
//                     ? DrawerItem(
//                         icon: Icons.list_alt_rounded,
//                         title: "Subscribed",
//                         callback: () {
//                           setState(() {
//                             index = 1;
//                           });
//                           Navigator.pop(context);
//                         },
//                       )
//                     : SelectedDrawerItem(
//                         icon: Icons.list_alt_rounded,
//                         title: "Subscribed",
//                         callback: () {
//                           setState(() {
//                             index = 1;
//                           });
//                           Navigator.pop(context);
//                         },
//                       ),
//                 index != 2
//                     ? DrawerItem(
//                         icon: Icons.insights_rounded,
//                         title: "Analytics",
//                         callback: () {
//                           setState(() {
//                             index = 2;
//                           });
//                           Navigator.pop(context);
//                         },
//                       )
//                     : SelectedDrawerItem(
//                         icon: Icons.insights_rounded,
//                         title: "Analytics",
//                         callback: () {
//                           setState(() {
//                             index = 2;
//                           });
//                           Navigator.pop(context);
//                         },
//                       ),
//                 index != 3
//                     ? DrawerItem(
//                         icon: Icons.newspaper_rounded,
//                         title: "Announcements",
//                         callback: () {
//                           setState(() {
//                             index = 3;
//                           });
//                           Navigator.pop(context);
//                         },
//                       )
//                     : SelectedDrawerItem(
//                         icon: Icons.newspaper_rounded,
//                         title: "Announcements",
//                         callback: () {
//                           setState(() {
//                             index = 3;
//                           });
//                           Navigator.pop(context);
//                         },
//                       ),
//                 index != 4
//                     ? DrawerItem(
//                         icon: Icons.list_alt_rounded,
//                         title: "Profile",
//                         callback: () {
//                           setState(() {
//                             index = 4;
//                           });
//                           Navigator.pop(context);
//                         },
//                       )
//                     : SelectedDrawerItem(
//                         icon: Icons.list_alt_rounded,
//                         title: "Profile",
//                         callback: () {
//                           setState(() {
//                             index = 4;
//                           });
//                           Navigator.pop(context);
//                         },
//                       ),
//                 const Divider(),
//                 index != 5
//                     ? DrawerItem(
//                         icon: Icons.person,
//                         title: "Edit Profile",
//                         callback: () {
//                           setState(() {
//                             index = 5;
//                           });
//                           Navigator.pop(context);
//                         },
//                       )
//                     : SelectedDrawerItem(
//                         icon: Icons.person,
//                         title: "Edit Profile",
//                         callback: () {
//                           setState(() {
//                             index = 5;
//                           });
//                           Navigator.pop(context);
//                         },
//                       ),
//                 index != 6
//                     ? DrawerItem(
//                         icon: Icons.location_on,
//                         title: "My Address",
//                         callback: () {
//                           setState(() {
//                             index = 6;
//                           });
//                           Navigator.pop(context);
//                         },
//                       )
//                     : SelectedDrawerItem(
//                         icon: Icons.location_on,
//                         title: "My Address",
//                         callback: () {
//                           setState(() {
//                             index = 6;
//                           });
//                           Navigator.pop(context);
//                         },
//                       ),
//                 index != 7
//                     ? DrawerItem(
//                         icon: Icons.info,
//                         title: "About Us",
//                         callback: () {
//                           // setState(() {
//                           //   index = 7;
//                           // });
//                           Navigator.pop(context);
//                           // Navigator.pushNamed(context, AboutUs.route);
//                         },
//                       )
//                     : SelectedDrawerItem(
//                         icon: Icons.info,
//                         title: "About Us",
//                         callback: () {
//                           // setState(() {
//                           //   index = 7;
//                           // });
//                           Navigator.pop(context);
//                           // Navigator.pushNamed(context, AboutUs.route);
//                         },
//                       ),
//                 index != 8
//                     ? DrawerItem(
//                         icon: Icons.logout,
//                         title: "Log Out",
//                         callback: () {
//                           showDialog(
//                             context: context,
//                             builder: (ctx) => AlertDialog(
//                               title: const Text("Log out"),
//                               content: const Text(
//                                   "Are You sure you want to log out?"),
//                               actions: <Widget>[
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     TextButton(
//                                       onPressed: () {
//                                         Navigator.of(ctx).pop();
//                                       },
//                                       child: Container(
//                                         // color: Colors.green,
//                                         padding: const EdgeInsets.all(14),
//                                         child: const Text("Cancel"),
//                                       ),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         // FirebaseAuth.instance.signOut();
//                                         // Navigator.pushReplacementNamed(
//                                         //     context, Login.route);
//                                       },
//                                       child: Container(
//                                         // color: Colors.green,
//                                         padding: const EdgeInsets.all(14),
//                                         child: const Text("Okay"),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       )
//                     : SelectedDrawerItem(
//                         icon: Icons.logout,
//                         title: "Log Out",
//                         callback: () {},
//                       ),
//                 index != 9
//                     ? DrawerItem(
//                         icon: Icons.exit_to_app,
//                         title: "Exit",
//                         callback: () {
//                           setState(() {
//                             index = 9;
//                           });
//                           Navigator.pop(context);
//                         },
//                       )
//                     : SelectedDrawerItem(
//                         icon: Icons.exit_to_app,
//                         title: "Exit",
//                         callback: () {
//                           setState(() {
//                             index = 9;
//                           });
//                           Navigator.pop(context);
//                         },
//                       ),
//                 const Divider(),
//                 index != 10
//                     ? DrawerItem(
//                         icon: Icons.settings,
//                         title: "Settings",
//                         callback: () {
//                           // Navigator.pop(context);
//                           // Navigator.pushNamed(context, Setting.route);
//                         },
//                       )
//                     : SelectedDrawerItem(
//                         icon: Icons.settings,
//                         title: "Settings",
//                         callback: () {
//                           // Navigator.pop(context);
//                           // Navigator.pushNamed(context, Setting.route);
//                         },
//                       ),
//                 index != 11
//                     ? DrawerItem(
//                         icon: Icons.format_align_center,
//                         title: "Terms and Condition",
//                         callback: () {
//                           // setState(() {
//                           //   index = 11;
//                           // });

//                           // Navigator.pop(context);
//                           // Navigator.pushNamed(context, TermAndCondition.route);
//                         },
//                       )
//                     : SelectedDrawerItem(
//                         icon: Icons.format_align_center,
//                         title: "Terms and Condition",
//                         callback: () {
//                           // setState(() {
//                           //   index = 11;
//                           // });
//                           // Navigator.pop(context);
//                           // Navigator.pushNamed(context, TermAndCondition.route);
//                         },
//                       ),
              
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Row(
//         children: [
//           if (MediaQuery.of(context).size.width > tabletSize)
//             Visibility(
//               visible: drawer,
//               child: Container(
//                 // margin: const EdgeInsets.all(15),
//                 child: Drawer(
//                   child: SingleChildScrollView(
//                     child: Container(
//                       padding: const EdgeInsets.all(12),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // const SizedBox(height: 10),
//                           // const Align(
//                           //     alignment: Alignment.centerLeft,
//                           //     child: Text(
//                           //       "Wubet Ayalew",
//                           //       style: TextStyle(fontWeight: FontWeight.bold),
//                           //     )),
//                           Center(
//                             child: InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   index = 5;
//                                 });
//                               },
//                               child: Container(
//                                 width: 130,
//                                 height: 130,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                         color: Colors.blue, width: 3),
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: NetworkImage(
//                                             SImages.lightAppLogo))),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Center(
//                             child: InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     index = 5;
//                                   });
//                                 },
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: const [
//                                     Text(
//                                       'Wubet ayalew',
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     Text("wubetayalew@gmail.com")
//                                   ],
//                                 )),
//                           ),
//                           const Divider(),
//                           index != 0
//                               ? DrawerItem(
//                                   icon: Icons.account_balance_rounded,
//                                   title: "Investment",
//                                   callback: () {
//                                     setState(() {
//                                       index = 0;
//                                     });
//                                   },
//                                 )
//                               : SelectedDrawerItem(
//                                   icon: Icons.account_balance_rounded,
//                                   title: "Investment",
//                                   callback: () {
//                                     setState(() {
//                                       index = 0;
//                                     });
//                                   },
//                                 ),
//                           index != 1
//                               ? DrawerItem(
//                                   icon: Icons.list_alt_rounded,
//                                   title: "Subscribed",
//                                   callback: () {
//                                     Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => DesktopResponsive(indexfromCall: 1)),
//             );
//                                   },
//                                 )
//                               : SelectedDrawerItem(
//                                   icon: Icons.list_alt_rounded,
//                                   title: "Subscribed",
//                                   callback: () {
//                                      Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => DesktopResponsive(indexfromCall: 1)),
//             );
//                                   },
//                                 ),
//                           index != 2
//                               ? DrawerItem(
//                                   icon: Icons.insights_rounded,
//                                   title: "Analytics",
//                                   callback: () {
//                                     setState(() {
//                                       index = 2;
//                                     });
//                                   },
//                                 )
//                               : SelectedDrawerItem(
//                                   icon: Icons.insights_rounded,
//                                   title: "Analytics",
//                                   callback: () {
//                                     setState(() {
//                                       index = 2;
//                                     });
//                                   },
//                                 ),
//                           index != 3
//                               ? DrawerItem(
//                                   icon: Icons.newspaper_rounded,
//                                   title: "Announcements",
//                                   callback: () {
//                                     setState(() {
//                                       index = 3;
//                                     });
//                                   },
//                                 )
//                               : SelectedDrawerItem(
//                                   icon: Icons.newspaper_rounded,
//                                   title: "Announcements",
//                                   callback: () {
//                                     setState(() {
//                                       index = 3;
//                                     });
//                                   },
//                                 ),
//                           index != 4
//                               ? DrawerItem(
//                                   icon: Icons.list_alt_rounded,
//                                   title: "Profile",
//                                   callback: () {
//                                     setState(() {
//                                       index = 4;
//                                     });
//                                   },
//                                 )
//                               : SelectedDrawerItem(
//                                   icon: Icons.list_alt_rounded,
//                                   title: "Profile",
//                                   callback: () {
//                                     setState(() {
//                                       index = 4;
//                                     });
//                                   },
//                                 ),
//                           const Divider(),
//                           index != 5
//                               ? DrawerItem(
//                                   icon: Icons.person,
//                                   title: "Edit Profile",
//                                   callback: () {
//                                     setState(() {
//                                       index = 5;
//                                     });
//                                   },
//                                 )
//                               : SelectedDrawerItem(
//                                   icon: Icons.person,
//                                   title: "Edit Profile",
//                                   callback: () {
//                                     setState(() {
//                                       index = 5;
//                                     });
//                                   },
//                                 ),
//                           index != 6
//                               ? DrawerItem(
//                                   icon: Icons.location_on,
//                                   title: "My Address",
//                                   callback: () {
//                                     setState(() {
//                                       index = 6;
//                                     });
//                                   },
//                                 )
//                               : SelectedDrawerItem(
//                                   icon: Icons.location_on,
//                                   title: "My Address",
//                                   callback: () {
//                                     setState(() {
//                                       index = 6;
//                                     });
//                                   },
//                                 ),
//                           index != 7
//                               ? DrawerItem(
//                                   icon: Icons.info,
//                                   title: "About Us",
//                                   callback: () {
//                                     setState(() {
//                                       index = 7;
//                                     });
//                                     // Navigator.pushNamed(context, About.route);
//                                   },
//                                 )
//                               : SelectedDrawerItem(
//                                   icon: Icons.info,
//                                   title: "About Us",
//                                   callback: () {
//                                     setState(() {
//                                       index = 7;
//                                     });
//                                     // Navigator.pushNamed(context, About.route);
//                                   },
//                                 ),
//                           index != 8
//                               ? DrawerItem(
//                                   icon: Icons.logout,
//                                   title: "Log Out",
//                                   callback: () {
//                                     showDialog(
//                                       context: context,
//                                       builder: (ctx) => AlertDialog(
//                                         title: const Text("Log out"),
//                                         content: const Text(
//                                             "Are You sure you want to log out?"),
//                                         actions: <Widget>[
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             children: [
//                                               TextButton(
//                                                 onPressed: () {
//                                                   Navigator.of(ctx).pop();
//                                                 },
//                                                 child: Container(
//                                                   // color: Colors.green,
//                                                   padding:
//                                                       const EdgeInsets.all(14),
//                                                   child: const Text("Cancel"),
//                                                 ),
//                                               ),
//                                               TextButton(
//                                                 onPressed: () {
//                                                   // FirebaseAuth.instance
//                                                   //     .signOut();
//                                                   // Navigator
//                                                   //     .pushReplacementNamed(
//                                                   //         context,
//                                                   //         Login.route);
//                                                 },
//                                                 child: Container(
//                                                   // color: Colors.green,
//                                                   padding:
//                                                       const EdgeInsets.all(14),
//                                                   child: const Text("Okay"),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 )
//                               : SelectedDrawerItem(
//                                   icon: Icons.logout,
//                                   title: "Log Out",
//                                   callback: () {},
//                                 ),
//                           index != 9
//                               ? DrawerItem(
//                                   icon: Icons.exit_to_app,
//                                   title: "Exit",
//                                   callback: () {
//                                     setState(() {
//                                       index = 9;
//                                     });
//                                   },
//                                 )
//                               : SelectedDrawerItem(
//                                   icon: Icons.exit_to_app,
//                                   title: "Exit",
//                                   callback: () {
//                                     setState(() {
//                                       index = 9;
//                                     });
//                                   },
//                                 ),
//                           const Divider(),
//                           index != 10
//                               ? DrawerItem(
//                                   icon: Icons.settings,
//                                   title: "Settings",
//                                   callback: () {
//                                     // Navigator.pushNamed(context, Setting.route);
//                                   },
//                                 )
//                               : SelectedDrawerItem(
//                                   icon: Icons.settings,
//                                   title: "Settings",
//                                   callback: () {
//                                     // Navigator.pushNamed(context, Setting.route);
//                                   },
//                                 ),
//                           index != 11
//                               ? DrawerItem(
//                                   icon: Icons.format_align_center,
//                                   title: "Terms and Condition",
//                                   callback: () {
//                                     // setState(() {
//                                     //   index = 11;
//                                     // });
//                                     // Navigator.pushNamed(
//                                     //     context, TermAndCondition.route);
//                                   },
//                                 )
//                               : SelectedDrawerItem(
//                                   icon: Icons.format_align_center,
//                                   title: "Terms and Condition",
//                                   callback: () {
//                                     // setState(() {
//                                     //   index = 11;
//                                     // });
//                                     // Navigator.pushNamed(
//                                     //     context, TermAndCondition.route);
//                                   },
//                                 ),
                          
                          
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           Expanded(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         if (MediaQuery.of(context).size.width > tabletSize) {
//                           setState(() {
//                             if (drawer) {
//                               drawer = false;
//                             } else {
//                               drawer = true;
//                             }
//                           });
//                         }
//                         if (MediaQuery.of(context).size.width < tabletSize) {
//                           _scaffoldKey.currentState?.openDrawer();
//                         }
//                       },
//                       icon: const Icon(
//                         Icons.menu,
//                         color: Colors.blue,
//                         // size: 50,
//                       ),
//                     ),
//                     const Text(
//                       'Synergy Stock Exchange',
//                       style: TextStyle(
//                           // fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue,
//                           decoration: TextDecoration.none),
//                     ),
//                     Expanded(child: SizedBox()),
//                     Container(
//                       width: 40,
//                       height: 40,
//                       margin: const EdgeInsets.only(right: 5),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.blue, width: 2),
//                           image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: NetworkImage(SImages.lightAppLogo))),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: Container(
//                     width: (drawer)
//                         ? 690
//                         : MediaQuery.of(context).size.width - 225,
//                     height: MediaQuery.of(context).size.height,
//                     child: widget
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ExploreElement extends StatelessWidget {
//   const ExploreElement({
//     Key? key,
//     required this.title,
//     required this.icon,
//   }) : super(key: key);
//   final String title;
//   final IconData icon;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             color: Colors.blue,
//           ),
//           const SizedBox(
//             width: 6,
//           ),
//           Text(title)
//         ],
//       ),
//     );
//   }
// }

// class SubscribedChannel extends StatelessWidget {
//   const SubscribedChannel({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//       child: Row(
//         children: [
//           Container(
//             width: 35,
//             height: 35,
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.blue, width: 1),
//                 shape: BoxShape.circle,
//                 image: const DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage(SImages.lightAppLogo))),
//           ),
//           // const Expanded(flex: 1, child: SizedBox()),
//           const SizedBox(
//             width: 10,
//           ),
//           const SizedBox(
//             width: 150,
//             child: Text(
//               "Abebe shop jk",
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SubscribedChannelSmall extends StatelessWidget {
//   const SubscribedChannelSmall({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//       child: Row(
//         children: [
//           Container(
//             width: 35,
//             height: 35,
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.blue, width: 1),
//                 shape: BoxShape.circle,
//                 image: const DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage(SImages.lightAppLogo))),
//           ),
//           // const Expanded(flex: 1, child: SizedBox()),
//           const SizedBox(
//             width: 10,
//           ),
//           const SizedBox(
//             width: 100,
//             child: Text(
//               "Abebe shop jk",
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DrawerItem extends StatelessWidget {
//   const DrawerItem({
//     Key? key,
//     required this.title,
//     required this.icon,
//     required this.callback,
//   }) : super(key: key);
//   final String title;
//   final IconData icon;
//   final VoidCallback callback;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: callback,
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [
//               const SizedBox(
//                 width: 10,
//               ),
//               Icon(icon, color: SColors.grey),
//               const SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   color: SColors.darkeGery,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SelectedDrawerItem extends StatelessWidget {
//   const SelectedDrawerItem({
//     Key? key,
//     required this.title,
//     required this.icon,
//     required this.callback,
//   }) : super(key: key);
//   final String title;
//   final IconData icon;
//   final VoidCallback callback;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: callback,
//       child: Container(
//         // decoration: BoxDecoration(
//         //     color: Colors.blue.shade50,
//         //     borderRadius: const BorderRadius.all(Radius.circular(10))),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Icon(icon, color: Colors.blue),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       title,
//                       style: const TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue),
//                     ),

//                     // VerticalDivider(
//                     //   width: 10,
//                     //   color: Colors.blue,
//                     // )
//                   ],
//                 ),
//                 Container(
//                   height: 30,
//                   width: 5,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.blue,
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

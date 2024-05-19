// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
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
// import 'about.dart';
// import 'components/analysis.dart';
// import 'components/announcement.dart';

// class DesktopResponsiveT extends StatefulWidget {
//   const DesktopResponsiveT({super.key});

//   @override
//   State<DesktopResponsiveT> createState() => _DesktopResponsiveTState();
// }

// class _DesktopResponsiveTState extends State<DesktopResponsiveT> {
//   int index = 0;
//   bool drawer = true;
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
//                       setState(() {
//                         index = 5;
//                       });
//                       Navigator.pop(context);
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
//                       setState(() {
//                         index = 5;
//                       });
//                       Navigator.pop(context);
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
//                 const Divider(),
//                 Container(
//                     margin: const EdgeInsets.all(15),
//                     child: const Text(
//                       "Subscribed Channals",
//                       style: TextStyle(
//                           fontSize: 18, color: Color.fromARGB(123, 0, 0, 0)),
//                     )),
//                 SubscribedChannel(),
//                 SubscribedChannel(),
//                 SubscribedChannel(),
//                 SubscribedChannel(),
//                 SubscribedChannel(),
//                 SubscribedChannel(),
//                 SubscribedChannel(),
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
//                                     setState(() {
//                                       index = 1;
//                                     });
//                                   },
//                                 )
//                               : SelectedDrawerItem(
//                                   icon: Icons.list_alt_rounded,
//                                   title: "Subscribed",
//                                   callback: () {
//                                     setState(() {
//                                       index = 1;
//                                     });
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
//                           const Divider(),
//                           Container(
//                               margin: const EdgeInsets.all(15),
//                               child: const Text(
//                                 "Subscribed Channals",
//                                 style: TextStyle(
//                                     fontSize: 18,
//                                     color: Color.fromARGB(123, 0, 0, 0)),
//                               )),
//                           SubscribedChannel(),
//                           SubscribedChannel(),
//                           SubscribedChannel(),
//                           SubscribedChannel(),
//                           SubscribedChannel(),
//                           SubscribedChannel(),
//                           SubscribedChannel(),
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
//                   child: Row(
//                     children: [
//                       Expanded(child: SizedBox()),
//                       // (MediaQuery.of(context).size.width > phoneSize)
//                       //     ?
//                       Container(
//                         width: (drawer)
//                             ? 690
//                             : MediaQuery.of(context).size.width - 225,
//                         height: MediaQuery.of(context).size.height,
//                         child:  Container(

//       child:
      
//          SingleChildScrollView(
//           child: Container(
//             width: MediaQuery.of(context).size.width-100,
//             margin: const EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 15),
//                 Container(
//                   child: const CircleAvatar(
//                     radius: 85,
//                     backgroundImage: AssetImage('asset/logo_image/goat.jpg'),
//                   ),
//                 ),
//                 const SizedBox(height: 14),
//                 Container(
//                   child: const Text(
//                     "Dawit nigus ",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Container(
//                   child: const Text(
//                     "Hawassa, Ethiopia ",
//                     style: TextStyle(fontSize: 20, color: Colors.grey),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Divider(),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width - 170,
//                       child: const Text(
//                         "share Company",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     Container(
//                       child: const Text(
//                         "habesha breweries",
//                         style: TextStyle(color: Colors.blue, fontSize: 15),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 18,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width - 130,
//                       child: const Text(
//                         "number of share to sell",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       child: const Text(
//                         "400 shares",
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 18,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width - 130,
//                       child: const Text(
//                         "unit share price",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 15,


// ),
//                     Container(
//                       child: const Text(
//                         "100 birr",
//                         style: TextStyle(color: Colors.blue, fontSize: 15),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 18,
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width - 130,
//                       child: const Text(
//                         "number of share to sell",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       child: const Text(
//                         "400 shares",
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Divider(),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                   child: const Text(
//                     "Contact",
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 18,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Icon(
//                       Iconsax.call,
//                       color: Colors.black,
//                       size: 18,
//                     ),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       child: const Text(
//                         "+2519-4203-0866",
//                         style: TextStyle(color: Colors.grey, fontSize: 18),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 18,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Icon(
//                       Iconsax.card,
//                       color: Colors.black,
//                       size: 18,
//                     ),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       child: const Text(
//                         "dawitnigus45@gmail.com",
//                         style: TextStyle(color: Colors.grey, fontSize: 18),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
      
//     ))
                      
//                       // : Container(
//                       //     width: MediaQuery.of(context).size.width,
//                       //     height: MediaQuery.of(context).size.height,
//                       //     child: IndexedStack(
//                       //       index: index,
//                       //       children: [
//                       //         Container(),
//                       //         Container(),
//                       //         Container(),
//                       //         Container(),
//                       //         Container(),
//                       //         Container(),
//                       //         Container(),
//                       //       ],
//                       //     ),
//                       //   )
//                       ,
                      
                     
//                     ],
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
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final List<String> bankAccount = [
//     "CBE,1000054478126,1000054478126",
//     "CBE,1000054478126,1000054478126",
//     "CBE,1000054478126,1000054478126"
//   ];

//   final TextEditingController bankNameController = TextEditingController();
//   final TextEditingController savingAccountForBankController =
//       TextEditingController();
//   final TextEditingController checkingAccountForBankController =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Bank Account List'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: bankAccount.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   List<String> accountInfo = bankAccount[index].split(',');
//                   String bankName = accountInfo[0];
//                   String savingAccount = accountInfo[1];
//                   String checkingAccount = accountInfo[2];

//                   return Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "Bank Name:",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(bankName)
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "Saving Account:",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(savingAccount)
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "Checking Account:",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(checkingAccount)
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               // Implement delete functionality here
//                               // For example: removeBankAccount(index)
//                             },
//                             child: Text("Delete"),
//                             style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStateProperty.all<Color>(Colors.red),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text('Add Bank Account'),
//                         content: Container(
//                           height: 320,
//                           padding: EdgeInsets.all(8),
//                           child: Column(
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text("Bank Name:"),
//                                   const SizedBox(
//                                     height: 8,
//                                   ),
//                                   TextFormField(
//                                     controller: bankNameController,
//                                     decoration: const InputDecoration(
//                                       labelText: 'Bank Name',
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 16,
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text("Saving Account:"),
//                                   const SizedBox(
//                                     height: 8,
//                                   ),
//                                   TextFormField(
//                                     controller:
//                                         savingAccountForBankController,
//                                     decoration: const InputDecoration(
//                                       labelText: 'Saving Account',
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 16,
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text("Checking Account:"),
//                                   const SizedBox(
//                                     height: 8,
//                                   ),
//                                   TextFormField(
//                                     controller:
//                                         checkingAccountForBankController,
//                                     decoration: const InputDecoration(
//                                       labelText: 'Checking Account',
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 16,
//                               ),
//                             ],
//                           ),
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                               bankNameController.text = "";
//                               savingAccountForBankController.text = "";
//                               checkingAccountForBankController.text = "";
//                             },
//                             child: Text('Close'),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               String bankInformation =
//                                   "${bankNameController.text},${savingAccountForBankController.text},${checkingAccountForBankController.text}";
//                               bankAccount.add(bankInformation);
//                               Navigator.pop(context);
//                               bankNameController.text = "";
//                               savingAccountForBankController.text = "";
//                               checkingAccountForBankController.text = "";
//                             },
//                             child: Text('Save'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//                 child: Text("Add Account"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

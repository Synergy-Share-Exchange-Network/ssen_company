// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:iconsax/iconsax.dart';

// import '../models/AnnouncementModel.dart';
// import '../utils/constants.dart';
// import '../utils/helper_function.dart';

// class Announcment extends StatelessWidget {
//   const Announcment({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isDark = SHelperFunction.isDarkMode(context);
//     AnnouncementModel announcement = AnnouncementModel(
//         identification: "11",
//         content:
//             "bitcoin is blomming the social and nural netork before someoe else fount it it is coing  my name is birhan I'm writing this from bottm of my heart.",
//         companyID: "companyID",
//         title: "cripto is reaching 1Billion people",
//         images: ["asset/logo_image/goat.jpg"]);

//     return Scaffold(
//       appBar: (MediaQuery.of(context).size.width > phoneSize)
//           ? PreferredSize(preferredSize: Size.zero, child: AppBar())
//           : AppBar(
//               actions: const [
//                 Icon(Iconsax.notification),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Icon(Iconsax.search_normal),
//                 SizedBox(
//                   width: 20,
//                 )
//               ],
//               backgroundColor:
//                   (!isDark) ? SColors.lighGrey : SColors.homePageNavBar,
//               leading: IconButton(
//                   onPressed: () {
//                     // Navigator.pop(context);
//                   },
//                   icon: const Icon(Icons.menu)),

//               // elevation: 1,
//             ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             NewsWidget(
//               announcement: announcement,
//             ),
//             NewsWidget(
//               announcement: announcement,
//             ),
//             NewsWidget(
//               announcement: announcement,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

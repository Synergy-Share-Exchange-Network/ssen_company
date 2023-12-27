// import 'package:flutter/material.dart';

// import 'package:ssen_user/Screens/components/home.dart';

// import 'package:ssen_user/screens/components/home.dart';
// import 'package:ssen_user/screens/components/subscribers.dart';
// import 'package:ssen_user/utils/constants/colors.dart';
// import 'package:ssen_user/utils/helper_function.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});
//   static const route = "main_page_state";

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int currentIndex = 0;
//   // final screens = [Home(), Subscription(), Favorite(), Cart(), Order()];
//   final screens = [
//     Home(),

//     Center(child: Text("2")),

//     Subscribers(),

//     Center(child: Text("3")),
//     Center(child: Text("4")),
//     Center(child: Text("5")),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     bool isDark = SHelperFunction.isDarkMode(context);

//     return Scaffold(
//         // drawer: const CustomDrawer(),
//         body: IndexedStack(
//           children: screens,
//           index: currentIndex,
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//             elevation: 0,
//             backgroundColor: (isDark) ? SColors.homePageNavBar : Colors.white,

//             showUnselectedLabels: true,
//             type: BottomNavigationBarType.fixed,
//             onTap: (index) => setState(() => currentIndex = index),
//             currentIndex: currentIndex,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.account_balance_rounded),

//                 label: "Invest",
//                 // backgroundColor: Colors.blue,

//                 label: "Share",
//                 backgroundColor: SColors.primary,

//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.list_alt_rounded),
//                 label: "Subscrib",
//                 // backgroundColor: Colors.blue
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.insights_rounded),
//                 label: "Analytics",
//                 // backgroundColor: Colors.blue
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.newspaper_rounded),
//                 label: "Announce",
//                 // backgroundColor: Colors.blue
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.list_alt_rounded),
//                 label: "Profile",
//                 // backgroundColor: Colors.blue
//               ),
//             ]));
//   }
// }
import 'package:flutter/material.dart';
import 'package:ssen_company/utils/constants/colors.dart';
import 'package:ssen_company/utils/helper_function.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const route = "main_page_state";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  // final screens = [Home(), Subscription(), Favorite(), Cart(), Order()];
  final screens = [
    Center(child: Text("1")),
    Center(child: Text("2")),
    Center(child: Text("3")),
    Center(child: Text("4")),
    Center(child: Text("5")),
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = SHelperFunction.isDarkMode(context);

    return Scaffold(
        // drawer: const CustomDrawer(),
        body: IndexedStack(
          children: screens,
          index: currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: (isDark) ? SColors.homePageNavBar : Colors.white,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => setState(() => currentIndex = index),
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.post_add_rounded),
                label: "Share",
                backgroundColor: SColors.primary,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded),
                label: "Subscribers",
                // backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.insights_rounded),
                label: "Analytics",
                // backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_rounded),
                label: "Announcements",
                // backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded),
                label: "Profile",
                // backgroundColor: Colors.blue
              ),
            ]));
  }
}

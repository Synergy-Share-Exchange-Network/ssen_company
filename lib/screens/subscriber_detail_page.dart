import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:printing/printing.dart';
import 'package:ssen_company/Models/user_model.dart';
import 'package:ssen_company/utils/constants.dart';

import '../services/theme/text_theme.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/navbar.dart';
import '../utils/helper_function.dart';

class SubscriberDetailPage extends StatelessWidget {
  final UserModel user;
  const SubscriberDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
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
          elevation: 0,
          title: Text(
            'Subscriber Detail',
            style: dark
                ? STextTheme.darkTextTheme.headlineSmall
                : STextTheme.lightTextTheme.headlineSmall,
          ),
        ),
        body: MediaQuery.of(context).size.width < phoneSize
            ? SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        child: CircleAvatar(
                          radius: 85,
                          backgroundImage: NetworkImage(user.profilePicture[0]),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        child: Text(
                          "${user.firstName} ${user.firstName}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 27),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        child: Text(
                          "${user.nationality} ${user.region}",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Divider(),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Container(
                      //       width: MediaQuery.of(context).size.width - 170,
                      //       child: const Text(
                      //         "share Company",
                      //         style: TextStyle(fontSize: 18),
                      //       ),
                      //     ),
                      //     Container(
                      //       child: const Text(
                      //         "habesha breweries",
                      //         style:
                      //             TextStyle(color: Colors.blue, fontSize: 15),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 18,
                      // ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Container(
                      //       width: MediaQuery.of(context).size.width - 130,
                      //       child: const Text(
                      //         "number of share to sell",
                      //         style: TextStyle(fontSize: 18),
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 15,
                      //     ),
                      //     Container(
                      //       child: const Text(
                      //         "400 shares",
                      //         style: TextStyle(
                      //           color: Colors.blue,
                      //           fontSize: 15,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 18,
                      // ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Container(
                      //       width: MediaQuery.of(context).size.width - 130,
                      //       child: const Text(
                      //         "unit share price",
                      //         style: TextStyle(fontSize: 18),
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 15,
                      //     ),
                      //     Container(
                      //       child: const Text(
                      //         "100 birr",
                      //         style:
                      //             TextStyle(color: Colors.blue, fontSize: 15),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 18,
                      // ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       width: MediaQuery.of(context).size.width - 130,
                      //       child: const Text(
                      //         "number of share to sell",
                      //         style: TextStyle(fontSize: 18),
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 15,
                      //     ),
                      //     Container(
                      //       child: const Text(
                      //         "400 shares",
                      //         style: TextStyle(
                      //           color: Colors.blue,
                      //           fontSize: 15,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      Divider(),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: const Text(
                          "Contact",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.call,
                            color: Colors.black,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: const Text(
                              "+2519-4203-0866",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.card,
                            color: Colors.black,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: const Text(
                              "dawitnigus45@gmail.com",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side containing photo, name, and location
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.start, // Align items to the top
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10), // Adjust top spacing
                            Container(
                              child: CircleAvatar(
                                radius: 85,
                                backgroundImage:
                                    NetworkImage(user.profilePicture[0]),
                              ),
                            ),
                            const SizedBox(
                                height:
                                    10), // Adjust spacing between photo and name
                            Container(
                              child: Text(
                                "${user.firstName} ${user.lastName}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 27),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              child: Text(
                                "${user.nationality} ${user.region}",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                            ),
                            const SizedBox(height: 20), // Adjust bottom spacing
                          ],
                        ),
                      ),
                      // Right side containing share company, share number, etc.
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "share Company",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "habesha breweries",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "number of share to sell",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "400 shares",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "unit share price",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "100 birr",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: const Text(
                                    "number of share to sell",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "400 shares",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Divider(),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: const Text(
                                    "Contact",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.call,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 15),
                                        const Text(
                                          "+2519-4203-0866",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 18),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Iconsax.card,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 15),
                                        const Text(
                                          "dawitnigus45@gmail.com",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}

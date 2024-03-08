import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_company/services/theme/text_theme.dart';
import 'package:ssen_company/utils/constants/colors.dart';

import '../utils/constants/size.dart';

import '../utils/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:ssen_company/screens/partial%20screen/add_share.dart';
import 'package:ssen_company/screens/partial%20screen/edit_share.dart';
import 'package:ssen_company/services/theme/text_theme.dart';
import 'package:ssen_company/widget/share.dart';

import '../utils/constants/size.dart';
import '../utils/helper_function.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Habesha Beer'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('asset/logo_image/goat.jpg'),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        backgroundColor: (!dark) ? SColors.lighGrey : SColors.homePageNavBar,
        leading: IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: const Icon(Icons.menu)),

        // elevation: 1,
      ),
      body: Column(
        children: [
          Product(),
          HorizontalScrollableBankAccount(),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditShare(), // Navigate to the destination page
                  ),
                );
              },
              child: Text('Edit Post'))
        ],
      ),
    );
  }
}

class HorizontalScrollableBankAccount extends StatelessWidget {
  final List<ScrollableItem> items = [
    ScrollableItem(
        title: 'Commercial Bank',
        savingAcc: '1000238493349',
        checkingAcc: '1000238493349'),
    ScrollableItem(
        title: 'Nib Bank',
        savingAcc: '1000238493349',
        checkingAcc: '1000238493349'),

    ScrollableItem(
        title: 'Dashen Bank',
        savingAcc: '1000238493349',
        checkingAcc: '1000238493349'),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "Bank Account",
            style: dark
                ? STextTheme.darkTextTheme.headlineSmall
                : STextTheme.lightTextTheme.headlineSmall,
          ),
        ),
        const SizedBox(
          height: SSizes.iconXS,
        ),
        SizedBox(
          height: 100.0, // Adjust the height as needed

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ScrollableListItem(item: items[index]);
            },
          ),
        ),
      ],
    );
  }
}

class ScrollableItem {
  final String title;
  final String savingAcc;
  final String checkingAcc;

  ScrollableItem(
      {required this.title,
      required this.savingAcc,
      required this.checkingAcc});
}

class ScrollableListItem extends StatelessWidget {
  final ScrollableItem item;

  ScrollableListItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return ScrollableItemWidget(item: item);
  }
}

class ScrollableItemWidget extends StatelessWidget {
  final ScrollableItem item;

  ScrollableItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: dark ? SColors.darkContainer : SColors.lightContainer,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            width: 1, color: Colors.grey), // Adjust border properties as needed
      ),
      child: ListView(
        children: [
          Text(item.title,
              style: dark
                  ? STextTheme.darkTextTheme.headlineSmall
                  : STextTheme.lightTextTheme.headlineSmall),
          Text(
            maxLines:
                2, // Adjust the number of lines you want to show initially
            overflow: TextOverflow.ellipsis,
            item.savingAcc,
            style: dark
                ? STextTheme.darkTextTheme.bodySmall
                : STextTheme.lightTextTheme.bodySmall,
          ),
          Text(
            maxLines:
                2, // Adjust the number of lines you want to show initially
            overflow: TextOverflow.ellipsis,
            item.checkingAcc,
            style: dark
                ? STextTheme.darkTextTheme.bodySmall
                : STextTheme.lightTextTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({super.key});

  // const Product({super.key, required this.product, required this.shopOwner});
  // final ProductModel product;
  // final ShopOwnerModel shopOwner;

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'data:image/jpeg;base64,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',
      'data:image/jpeg;base64,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',
    ];
    final dark = SHelperFunction.isDarkMode(context);
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                InkWell(
                  // onTap: () =>
                  //     // Navigator.pushNamed(context, ProductDetail.route),
                  // // child: Container(
                  // //   width: MediaQuery.of(context).size.width,
                  // //   height: 250,
                  // //   decoration: BoxDecoration(
                  // //       shape: BoxShape.rectangle,
                  // //       image: DecorationImage(
                  // //           fit: BoxFit.cover,
                  // //           image: AssetImage(product.image![0]))),
                  // // ),

                  child: ImageSlideshow(
                    width: MediaQuery.of(context).size.width / 0.7,
                    height: 250,
                    initialPage: 0,
                    indicatorColor: Colors.blue,
                    indicatorBackgroundColor: Colors.grey,
                    onPageChanged: (value) {
                      // print('Page changed: $value');
                    },
                    autoPlayInterval: 10000,
                    isLoop: true,
                    children: imageUrls.map((url) {
                      return Container(
                          decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(url)),
                      ));
                    }).toList(),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print('product.image![0]');
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
        Material(
          child: InkWell(
            // onTap: () => Navigator.pushNamed(context, ProductDetail.route),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              width: MediaQuery.of(context).size.width,
              // height: 70,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Share Price :  1000',
                      style: dark
                          ? STextTheme.darkTextTheme.bodyMedium
                          : STextTheme.lightTextTheme.bodyMedium,
                    ),
                  ),
                  Row(children: [
                    Text(
                      'Number Of Share : 100',
                      style: dark
                          ? STextTheme.darkTextTheme.bodyMedium
                          : STextTheme.lightTextTheme.bodyMedium,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ]),
                  Row(
                    children: [
                      Text(
                        'Proclamation Number',
                        style: dark
                            ? STextTheme.darkTextTheme.titleSmall
                            : STextTheme.lightTextTheme.titleSmall,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Center(
                        child: Text(
                          'Descrination',
                          style: dark
                              ? STextTheme.darkTextTheme.titleSmall
                              : STextTheme.lightTextTheme.titleSmall,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

// //Desktop
// class ProductDesktop extends StatelessWidget {
//   const ProductDesktop({super.key});
//   //  {super.key, required this.product, required this.shopOwner});
//   // final ProductModel product;
//   // final ShopOwnerModel shopOwner;

//   @override
//   Widget build(BuildContext context) {
//     final List<String> imageUrls = [
//       'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//       'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//       'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//       'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//       'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//       'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
//     ];
//     return Card(
//       elevation: 2,
//       child: Container(
//         margin: const EdgeInsets.all(12),
//         // width: 300,
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           InkWell(
//             // onTap: () => Navigator.pushNamed(context, ChannelShop.route),
//             child: Container(
//               width: 300,
//               // height: 45,
//               color: Colors.white,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
//                 child: Container(
//                   margin: const EdgeInsets.only(left: 5),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 45,
//                         height: 45,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: AssetImage('shopOwner.image![0]'))),
//                       ),
//                       // const Expanded(flex: 1, child: SizedBox()),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             width: 300 - 120,
//                             child: Text(
//                               'shopOwner.name',
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 300 - 120,
//                             child: Text(
//                               '  shopOwner.littleDescraption ?? ' '',
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                   color: Color.fromARGB(120, 0, 0, 0)),
//                             ),
//                           )
//                         ],
//                       ),
//                       const Expanded(child: SizedBox()),
//                       // ElevatedButton(
//                       //     onPressed: () {},
//                       //     child: const Text(
//                       //       "Subscribe",
//                       //       style: TextStyle(
//                       //           fontWeight: FontWeight.normal, fontSize: 22),
//                       //     )),
//                       // const Expanded(flex: 1, child: SizedBox()),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(
//                           Icons.more_vert,
//                           size: 25,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Stack(
//             alignment: AlignmentDirectional.bottomEnd,
//             children: [
//               Stack(
//                 alignment: AlignmentDirectional.topEnd,
//                 children: [
//                   InkWell(
//                     // onTap: () =>
//                     //     Navigator.pushNamed(context, ProductDetail.route),
//                     // // child: Container(
//                     // //   width: 300,
//                     // //   height: 250,
//                     // //   decoration: BoxDecoration(
//                     // //       shape: BoxShape.rectangle,
//                     // //       image: DecorationImage(
//                     // //           fit: BoxFit.cover,
//                     // //           image: AssetImage(product.image![0]))),
//                     // // ),
//                     child: ImageSlideshow(
//                       width: 300,
//                       height: 250,
//                       initialPage: 0,
//                       indicatorColor: Colors.orange,
//                       indicatorBackgroundColor: Colors.grey,
//                       onPageChanged: (value) {
//                         // print('Page changed: $value');
//                       },
//                       autoPlayInterval: 10000,
//                       isLoop: true,
//                       children: imageUrls.map((url) {
//                         return Container(
//                             decoration: BoxDecoration(
//                           image: DecorationImage(
//                               fit: BoxFit.cover, image: NetworkImage(url)),
//                         ));
//                       }).toList(),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       print('product.image![0]');
//                     },
//                     icon: const Icon(
//                       Icons.favorite,
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ),
//               Container(
//                 margin: EdgeInsets.all(8),
//                 width: 65,
//                 // height: 30,
//                 decoration: const BoxDecoration(
//                     color: Colors.orange,
//                     borderRadius: BorderRadius.all(Radius.circular(20))),
//                 child: Row(
//                   children: [
//                     const Expanded(child: SizedBox()),
//                     const Icon(
//                       Icons.star_half,
//                       color: Colors.white,
//                     ),
//                     Text(
//                       'the ',
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                     const Expanded(child: SizedBox()),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           InkWell(
//             // onTap: () => Navigator.pushNamed(context, ProductDetail.route),
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 7),
//               width: 300,
//               // height: 70,
//               color: Colors.white,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: 300,
//                     child: Text(
//                       'product.productName',
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         '',
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 20),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Text(
//                           '',
//                           style: const TextStyle(
//                               fontWeight: FontWeight.normal,
//                               decoration: TextDecoration.lineThrough,
//                               decorationColor: Colors.red,
//                               decorationThickness: 3),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       ElevatedButton(
//                           onPressed: () {},
//                           child: const Text("Buy Now",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.normal,
//                               ))),
//                       const SizedBox(
//                         width: 15,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           print("Added to cart");
//                         },
//                         child: Container(
//                           width: 60,
//                           height: 40,
//                           decoration: BoxDecoration(
//                               border:
//                                   Border.all(width: 2, color: Colors.orange),
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(18))),
//                           child: const Icon(
//                             Icons.add_shopping_cart_outlined,
//                             color: Color.fromARGB(167, 0, 0, 0),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       Row(
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               print("add one");
//                             },
//                             child: Container(
//                               width: 40,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       width: 2,
//                                       color: const Color.fromARGB(62, 0, 0, 0)),
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(8))),
//                               child: const Icon(
//                                 Icons.add,
//                                 color: Color.fromARGB(94, 0, 0, 0),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           const Text(
//                             "1",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 25),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           InkWell(
//                             onTap: () {
//                               print("remove  one");
//                             },
//                             child: Container(
//                               width: 40,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       width: 2,
//                                       color: const Color.fromARGB(62, 0, 0, 0)),
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(8))),
//                               child: const Icon(
//                                 Icons.remove,
//                                 color: Color.fromARGB(94, 0, 0, 0),
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }

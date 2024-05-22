// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:photo_view/photo_view.dart';

// import '../Models/company_profile_model.dart';
// import '../Models/share_model.dart';
// import '../utils/constants/colors.dart';
// import '../utils/constants/navbar.dart';
// import '../utils/helper_function.dart';
// import '../widget/share_detail_element_widget.dart';
// import '../utils/constants.dart';

// class SharePage extends StatefulWidget {
//   const SharePage({Key? key}) : super(key: key);

//   @override
//   State<SharePage> createState() => _SharePageState();
// }

// class _SharePageState extends State<SharePage> {
//   ShareModel share = ShareModel(
//     savingAccountPercentage: 12.5,
//     proclamationNumber: "PRO123",
//     minimumNumberOfBuyer: 5,
//     maximumNumberOfBuyer: 20,
//     bankInformation: ['Nib ,10000000023230,131240232', 'Bank B', 'Bank C'],
//     shareImage: ['asset/logo_image/goat.jpg', 'asset/logo_image/goat.jpg'],
//     unitSharePrice: 15.75,
//     noOfShares: 500,
//     divident: 7.2,
//     minimumPaymentInPercent: 10.0,
//     minimumNumberOfSharesToBuy: 1.0,
//     maximumNumberOfSharesToBuy: 50.0,
//     requirement: "Valid ID proof required",
//     identification: "ABC123",
//     companyID: "COMP456",
//     description: "Invest in our company shares for great returns!",
//     searchKeyWords: ['investment', 'shares', 'dividend'],
//     returnDividentDescription: ["Yearly", "Biannually"],
//     timeToReturnRemainPayment: 90,
//     currency: "USD",
//     dateAdded: "2024-05-18",
//     isDeleted: false,
//     isHidden: false,
//   );

//   int indexOfImage = 0;

//   @override
//   Widget build(BuildContext context) {
//     final dark = SHelperFunction.isDarkMode(context);
//     List<String> imageUrls = [];

//     if (share.shareImage != null) {
//       imageUrls = share.shareImage!;
//     }
//     // final List<String> imageUrls = [
//     //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//     //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//     //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//     //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//     //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//     //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//     //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//     //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//     //   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//     //   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//     //   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
//     // ];

//     return Scaffold(
//       drawer: (MediaQuery.of(context).size.width > phoneSize) ? null : NavBar(),
//       appBar: (MediaQuery.of(context).size.width > phoneSize)
//           ? null
//           : AppBar(
//               actions: const [
//                 // Icon(Iconsax.notification),
//                 // SizedBox(
//                 //   width: 10,
//                 // ),
//                 // Icon(Iconsax.search_normal),
//                 SizedBox(
//                   width: 20,
//                 )
//               ],
//               backgroundColor:
//                   !dark ? SColors.lighGrey : SColors.homePageNavBar,

//               // elevation: 1,
//             ),
//       body: (MediaQuery.of(context).size.width < phoneSize)
//           ? Stack(
//               children: [
//                 Stack(
//                   alignment: AlignmentDirectional.bottomCenter,
//                   children: [
//                     SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Container(
//                           //   decoration: BoxDecoration(
//                           //     color: Colors.white,
//                           //     border: Border.all(
//                           //         color: const Color.fromARGB(17, 0, 0, 0),
//                           //         width: 1),
//                           //   ),
//                           //   margin: const EdgeInsets.symmetric(
//                           //       horizontal: 10, vertical: 10),
//                           //   child: InkWell(
//                           //     onTap: () => Navigator.pushNamed(
//                           //         context, ChannelShop.route),
//                           //     child: Container(
//                           //       margin: const EdgeInsets.all(5),
//                           //       child: Row(
//                           //         children: [
//                           //           Container(
//                           //             width: 45,
//                           //             height: 45,
//                           //             decoration: BoxDecoration(
//                           //                 shape: BoxShape.circle,
//                           //                 image: DecorationImage(
//                           //                     fit: BoxFit.cover,
//                           //                     image: NetworkImage(widget
//                           //                         .shopOwner.image![0]
//                           //                         .split('<thumbnail>')[1]))),
//                           //           ),
//                           //           // const Expanded(flex: 1, child: SizedBox()),
//                           //           const SizedBox(
//                           //             width: 10,
//                           //           ),
//                           //           Column(
//                           //             crossAxisAlignment:
//                           //                 CrossAxisAlignment.start,
//                           //             children: [
//                           //               Text(
//                           //                 widget.shopOwner.name,
//                           //                 style: const TextStyle(
//                           //                   fontWeight: FontWeight.bold,
//                           //                 ),
//                           //               ),
//                           //               Text(
//                           //                 widget.shopOwner.littleDescraption!,
//                           //                 style: const TextStyle(
//                           //                     color:
//                           //                         Color.fromARGB(120, 0, 0, 0)),
//                           //               )
//                           //             ],
//                           //           ),
//                           //           const Expanded(child: SizedBox()),
//                           //           Container(
//                           //             // width: 160,
//                           //             // height: 40,
//                           //             child: ElevatedButton(
//                           //                 style: ElevatedButton.styleFrom(
//                           //                     primary: Colors.orange.shade300),
//                           //                 onPressed: () {},
//                           //                 child: const Text("Subscribe",
//                           //                     style: TextStyle(
//                           //                       color: Colors.white,
//                           //                       fontWeight: FontWeight.normal,
//                           //                     ))),
//                           //           ),
//                           //           // ElevatedButton(
//                           //           //     onPressed: () {},
//                           //           //     child: const Text(
//                           //           //       "Subscribe",
//                           //           //       style: TextStyle(
//                           //           //           fontWeight: FontWeight.normal, fontSize: 22),
//                           //           //     )),
//                           //           // const Expanded(flex: 1, child: SizedBox()),
//                           //           // const Icon(
//                           //           //   Icons.more_vert,
//                           //           //   size: 25,
//                           //           // )
//                           //         ],
//                           //       ),
//                           //     ),
//                           //   ),
//                           // ),
//                           InkWell(
//                             onTap: () {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (context) => Material(
//                                     child: Stack(
//                                       alignment: AlignmentDirectional.topEnd,
//                                       children: [
//                                         PhotoView(
//                                           imageProvider: NetworkImage(
//                                               imageUrls[indexOfImage]
//                                                   .split('<thumbnail>')[0]),
//                                         ),
//                                         Container(
//                                           padding: const EdgeInsets.all(12),
//                                           child: IconButton(
//                                               onPressed: () =>
//                                                   Navigator.pop(context),
//                                               icon: const Icon(
//                                                 Icons.close,
//                                                 color: Colors.white,
//                                               )),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: Container(
//                               margin: const EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 0),
//                               width: MediaQuery.of(context).size.width - 20,
//                               height: 250,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: const Color.fromARGB(17, 0, 0, 0),
//                                       width: 5),
//                                   shape: BoxShape.rectangle,
//                                   image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image: NetworkImage(
//                                           imageUrls[indexOfImage]
//                                               .split('<thumbnail>')[0]))),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 0),
//                             child: Wrap(
//                               spacing:
//                                   8.0, // Horizontal spacing between children
//                               runSpacing: 8.0, // Vertical spacing between lines
//                               children: imageUrls.asMap().entries.map((entry) {
//                                 return InkWell(
//                                   onTap: () {
//                                     print(entry.key);
//                                     setState(() {
//                                       indexOfImage = entry.key;
//                                     });
//                                   },
//                                   child: Container(
//                                     width: 70,
//                                     height: 70,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.rectangle,
//                                       border: Border.all(
//                                           color: Colors.orange,
//                                           width: (indexOfImage == entry.key)
//                                               ? 3
//                                               : 1),
//                                       image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: NetworkImage(imageUrls[entry.key]
//                                             .split('<thumbnail>')[0]),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                             ),
//                           ),

//                           Padding(
//                             padding: const EdgeInsets.only(left: 10),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   child: Text(
//                                     share.description,
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16),
//                                   ),
//                                 ),
//                                 // Row(
//                                 //   children: [
//                                 //     Text(
//                                 //       'Share price :',
//                                 //       style: TextStyle(
//                                 //           fontWeight: FontWeight.bold,
//                                 //           fontSize: 20),
//                                 //     ),
//                                 //     SizedBox(
//                                 //       width: 10,
//                                 //     ),
//                                 //     Text(
//                                 //       '${share.unitSharePrice.toString()} Birr',
//                                 //       style: TextStyle(
//                                 //           color: Colors.blue,
//                                 //           fontWeight: FontWeight.bold,
//                                 //           fontSize: 20),
//                                 //     ),
//                                 //     //  Text(
//                                 //     //             '${share.unitSharePrice.toString()} Birr',
//                                 //     //             style: TextStyle(
//                                 //     //                 fontWeight: FontWeight.bold,
//                                 //     //                 fontSize: 20),
//                                 //     //           ),
//                                 //   ],
//                                 // ),
//                                 // Row(
//                                 //   children: [
//                                 //     Text(
//                                 //       'Number of share :',
//                                 //       style: TextStyle(
//                                 //           fontWeight: FontWeight.bold,
//                                 //           fontSize: 20),
//                                 //     ),
//                                 //     SizedBox(
//                                 //       width: 10,
//                                 //     ),
//                                 //     Text(
//                                 //       '${share.noOfShares.toString()} Shares',
//                                 //       style: TextStyle(
//                                 //           color: Colors.blue,
//                                 //           fontWeight: FontWeight.bold,
//                                 //           fontSize: 20),
//                                 //     ),
//                                 //     //  Text(
//                                 //     //             '${share.unitSharePrice.toString()} Birr',
//                                 //     //             style: TextStyle(
//                                 //     //                 fontWeight: FontWeight.bold,
//                                 //     //                 fontSize: 20),
//                                 //     //           ),
//                                 //   ],
//                                 // ),

//                                 const Text(
//                                   "About Share ",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   // ignore: prefer_const_literals_to_create_immutables
//                                   children: [
//                                     ShareDetailElementWidget(
//                                       title1: 'unit Share Price ',
//                                       content: '${share.unitSharePrice}',
//                                       contentPrice: 'ETB(birr)',
//                                       title2: 'Number of Buyers ',
//                                       content2:
//                                           "minimum number of share :${share.minimumNumberOfBuyer}",
//                                       contentPrice2:
//                                           'Maximum number of share :${share.maximumNumberOfBuyer}',
//                                     ),
//                                     ShareDetailElementWidget(
//                                       title1: 'number share ',
//                                       content: '${share.noOfShares}',
//                                       contentPrice: 'units',
//                                       title2: 'Divident  ',
//                                       content2: '${share.divident}',
//                                       contentPrice2:
//                                           // '${share.returnDividentTimeInDays}',
//                                           '',
//                                     ),
//                                     ShareDetailElementWidget(
//                                       title1: 'minimum payment ',
//                                       content:
//                                           '${share.minimumPaymentInPercent}',
//                                       contentPrice: '',
//                                       title2: 'Number of share to buy ',
//                                       content2:
//                                           'maximum : ${share.maximumNumberOfSharesToBuy}',
//                                       contentPrice2:
//                                           'minimum : ${share.minimumNumberOfSharesToBuy}',
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 15,
//                                 ),
//                                 ShareElementWidget(
//                                     title: 'Proclamation Number',
//                                     description: '${share.proclamationNumber}'),
//                                 ShareElementWidget(
//                                     title: 'Requiremnet ',
//                                     description: '${share.requirement}'),
//                                 ShareElementWidget(
//                                     title: 'Time to return remain payement',
//                                     description:
//                                         '${share.timeToReturnRemainPayment}'),
//                                 ShareElementWidget(
//                                     title: 'Bank Information',
//                                     description: '${share.bankInformation}'),

//                                 Text('descraption'),

//                                 // Text('data')
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             )
//           : Stack(
//               alignment: AlignmentDirectional.bottomCenter,
//               children: [
//                 SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Container(
//                       //   decoration: BoxDecoration(
//                       //     color: Colors.white,
//                       //     border: Border.all(
//                       //         color: const Color.fromARGB(17, 0, 0, 0),
//                       //         width: 1),
//                       //   ),
//                       //   margin: const EdgeInsets.symmetric(
//                       //       horizontal: 10, vertical: 10),
//                       //   child: InkWell(
//                       //     // onTap: () =>
//                       //     //   //  Navigator.pushNamed(c ontext, ChannelShop.route),
//                       //     child: Container(
//                       //       margin: const EdgeInsets.all(5),
//                       //       child: Row(
//                       //         children: [
//                       //           Container(
//                       //             width: 45,
//                       //             height: 45,
//                       //             decoration: const BoxDecoration(
//                       //                 shape: BoxShape.circle,
//                       //                 image: DecorationImage(
//                       //                     fit: BoxFit.cover,
//                       //                     image: AssetImage(
//                       //                         'images/person1.jpg'))),
//                       //           ),
//                       //           // const Expanded(flex: 1, child: SizedBox()),
//                       //           const SizedBox(
//                       //             width: 10,
//                       //           ),
//                       //           Column(
//                       //             crossAxisAlignment: CrossAxisAlignment.start,
//                       //             children: const [
//                       //               Text(
//                       //                 "Shop name",
//                       //                 style: TextStyle(
//                       //                   fontWeight: FontWeight.bold,
//                       //                 ),
//                       //               ),
//                       //               Text(
//                       //                 'shop description',
//                       //                 style: TextStyle(
//                       //                     color: Color.fromARGB(120, 0, 0, 0)),
//                       //               )
//                       //             ],
//                       //           ),
//                       //           const Expanded(child: SizedBox()),
//                       //           Container(
//                       //             width: 160,
//                       //             height: 40,
//                       //             child: ElevatedButton(
//                       //                 style: ElevatedButton.styleFrom(
//                       //                     primary: Colors.orange.shade300),
//                       //                 onPressed: () {},
//                       //                 child: const Text("Subscribe",
//                       //                     style: TextStyle(
//                       //                         color: Colors.white,
//                       //                         fontWeight: FontWeight.normal,
//                       //                         fontSize: 20))),
//                       //           ),

//                       //           // ElevatedButton(
//                       //           //     onPressed: () {},
//                       //           //     child: const Text(
//                       //           //       "Subscribe",
//                       //           //       style: TextStyle(
//                       //           //           fontWeight: FontWeight.normal, fontSize: 22),
//                       //           //     )),
//                       //           // const Expanded(flex: 1, child: SizedBox()),
//                       //           // const Icon(
//                       //           //   Icons.more_vert,
//                       //           //   size: 25,
//                       //           // )
//                       //         ],
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               SizedBox(
//                                 child: Expanded(
//                                   flex: 1,
//                                   child: InkWell(
//                                     onTap: () {
//                                       Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                           builder: (context) => Material(
//                                             child: Stack(
//                                               alignment:
//                                                   AlignmentDirectional.topEnd,
//                                               children: [
//                                                 PhotoView(
//                                                   imageProvider: NetworkImage(
//                                                       imageUrls[indexOfImage]
//                                                           .split(
//                                                               '<thumbnail>')[0]),
//                                                 ),
//                                                 Container(
//                                                   padding:
//                                                       const EdgeInsets.all(12),
//                                                   child: IconButton(
//                                                       onPressed: () =>
//                                                           Navigator.pop(
//                                                               context),
//                                                       icon: const Icon(
//                                                         Icons.close,
//                                                         color: Colors.white,
//                                                       )),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                     child: Container(
//                                       margin: const EdgeInsets.symmetric(
//                                           horizontal: 0, vertical: 0),
//                                       width:
//                                           MediaQuery.of(context).size.width / 2,
//                                       height:
//                                           MediaQuery.of(context).size.width / 3,
//                                       decoration: BoxDecoration(
//                                           border: Border.all(
//                                               color: const Color.fromARGB(
//                                                   17, 0, 0, 0),
//                                               width: 5),
//                                           shape: BoxShape.rectangle,
//                                           image: DecorationImage(
//                                               fit: BoxFit.cover,
//                                               image: NetworkImage(
//                                                   imageUrls[indexOfImage].split(
//                                                       '<thumbnail>')[0]))),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Expanded(
//                                 flex: 2,
//                                 child: Wrap(
//                                   spacing:
//                                       8.0, // Horizontal spacing between children
//                                   runSpacing:
//                                       8.0, // Vertical spacing between lines
//                                   children:
//                                       imageUrls.asMap().entries.map((entry) {
//                                     return InkWell(
//                                       onTap: () {
//                                         print(entry.key);
//                                         setState(() {
//                                           indexOfImage = entry.key;
//                                         });
//                                       },
//                                       child: Container(
//                                         width: 70,
//                                         height: 70,
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.rectangle,
//                                           border: Border.all(
//                                               color: Colors.blue,
//                                               width: (indexOfImage == entry.key)
//                                                   ? 3
//                                                   : 1),
//                                           image: DecorationImage(
//                                             fit: BoxFit.cover,
//                                             image: NetworkImage(
//                                                 imageUrls[entry.key]
//                                                     .split('<thumbnail>')[0]),
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width / 3,
//                                 child: Text(
//                                   share.description,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16),
//                                 ),
//                               ),
//                               // Row(
//                               //   children: [
//                               //     Text(
//                               //       'Share price :',
//                               //       style: TextStyle(
//                               //           fontWeight: FontWeight.bold,
//                               //           fontSize: 20),
//                               //     ),
//                               //     SizedBox(
//                               //       width: 10,
//                               //     ),
//                               //     Text(
//                               //       '${share.unitSharePrice.toString()} Birr',
//                               //       style: TextStyle(
//                               //           color: Colors.blue,
//                               //           fontWeight: FontWeight.bold,
//                               //           fontSize: 20),
//                               //     ),
//                               //     //  Text(
//                               //     //             '${share.unitSharePrice.toString()} Birr',
//                               //     //             style: TextStyle(
//                               //     //                 fontWeight: FontWeight.bold,
//                               //     //                 fontSize: 20),
//                               //     //           ),
//                               //   ],
//                               // ),
//                               // Row(
//                               //   children: [
//                               //     Text(
//                               //       'Number of share :',
//                               //       style: TextStyle(
//                               //           fontWeight: FontWeight.bold,
//                               //           fontSize: 20),
//                               //     ),
//                               //     SizedBox(
//                               //       width: 10,
//                               //     ),
//                               //     Text(
//                               //       '${share.noOfShares.toString()} Shares',
//                               //       style: TextStyle(
//                               //           color: Colors.blue,
//                               //           fontWeight: FontWeight.bold,
//                               //           fontSize: 20),
//                               //     ),
//                               //     //  Text(
//                               //     //             '${share.unitSharePrice.toString()} Birr',
//                               //     //             style: TextStyle(
//                               //     //                 fontWeight: FontWeight.bold,
//                               //     //                 fontSize: 20),
//                               //     //           ),
//                               //   ],
//                               // ),

//                               const Text(
//                                 "About Share ",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 // ignore: prefer_const_literals_to_create_immutables
//                                 children: [
//                                   ShareDetailElementWidget(
//                                     title1: 'unit Share Price ',
//                                     content: '${share.unitSharePrice}',
//                                     contentPrice: 'ETB(birr)',
//                                     title2: 'Number of Buyers ',
//                                     content2:
//                                         "minimum number of share :${share.minimumNumberOfBuyer}",
//                                     contentPrice2:
//                                         'Maximum number of share :${share.maximumNumberOfBuyer}',
//                                   ),
//                                   ShareDetailElementWidget(
//                                     title1: 'number share ',
//                                     content: '${share.noOfShares}',
//                                     contentPrice: 'units',
//                                     title2: 'Divident  ',
//                                     content2: '${share.divident}',
//                                     contentPrice2:
//                                         // '${share.returnDividentTimeInDays}',
//                                         '',
//                                   ),
//                                   ShareDetailElementWidget(
//                                     title1: 'minimum payment ',
//                                     content: '${share.minimumPaymentInPercent}',
//                                     contentPrice: '',
//                                     title2: 'Number of share to buy ',
//                                     content2:
//                                         'maximum : ${share.maximumNumberOfSharesToBuy}',
//                                     contentPrice2:
//                                         'minimum : ${share.minimumNumberOfSharesToBuy}',
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 15,
//                               ),
//                               ShareElementWidget(
//                                   title: 'Proclamation Number',
//                                   description: '${share.proclamationNumber}'),
//                               ShareElementWidget(
//                                   title: 'Requiremnet ',
//                                   description: '${share.requirement}'),
//                               ShareElementWidget(
//                                   title: 'Time to return remain payement',
//                                   description:
//                                       '${share.timeToReturnRemainPayment}'),
//                               ShareElementWidget(
//                                   title: 'Bank Information',
//                                   description: '${share.bankInformation}'),

//                               Text('descraption'),

//                               // Text('data')
//                             ],
//                           )
//                         ],
//                       ),
//                       // Comment(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }

// class DotAndText extends StatelessWidget {
//   const DotAndText({
//     Key? key,
//     required this.text,
//   }) : super(key: key);
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return (MediaQuery.of(context).size.width < phoneSize)
//         ? Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                       flex: 1,
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 6),
//                         child: Icon(
//                           color: Color.fromARGB(172, 0, 0, 0),
//                           Icons.circle,
//                           size: 10,
//                         ),
//                       )),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Expanded(
//                     flex: 20,
//                     child: Text(text),
//                   )
//                 ],
//               )
//             ],
//           )
//         : Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(top: 6),
//                     child: Icon(
//                       color: Color.fromARGB(172, 0, 0, 0),
//                       Icons.circle,
//                       size: 10,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Container(
//                       width: MediaQuery.of(context).size.width * 0.40,
//                       child: Text(text))
//                 ],
//               )
//             ],
//           );
//   }
// }

// class ShareElementWidget extends StatefulWidget {
//   const ShareElementWidget({
//     Key? key,
//     required this.title,
//     required this.description,

//     // required this.function,
//   }) : super(key: key);
//   final String title;
//   final String description;

//   @override
//   State<ShareElementWidget> createState() => _ShareElementWidgetState();
// }

// class _ShareElementWidgetState extends State<ShareElementWidget> {
//   bool visablity = false;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: 40,
//       margin: const EdgeInsets.all(5),
//       child: Column(
//         children: [
//           SizedBox(
//             width: 600,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   widget.title,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 3,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       visablity = !visablity;
//                     });
//                   },
//                   child: visablity
//                       ? const Icon(
//                           Icons.keyboard_arrow_up_sharp,
//                           color: Colors.blue,
//                           size: 30,
//                         )
//                       : const Icon(
//                           Icons.keyboard_arrow_down_sharp,
//                           color: Colors.blue,
//                           size: 30,
//                         ),
//                 ),
//               ],
//             ),
//           ),
//           Visibility(
//               visible: visablity,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Text(style: TextStyle(fontSize: 12), widget.description),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               )),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }

//++++++++++++++++++++++++++++++++new code+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/screens/partial%20screen/add_share.dart';
import 'package:ssen_company/screens/partial%20screen/edit_main_profile.dart';
import 'package:ssen_company/utils/constants.dart';

import '../Models/company_profile_model.dart';
import '../Models/share_model.dart';
import '../provider/company_provider.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/navbar.dart';
import '../utils/helper_function.dart';
import '../widget/analytics/graph1.dart';
import '../widget/share_detail_element_widget.dart';

class SharePage extends StatefulWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    // ShareModel share = ShareModel(
    //   savingAccountPercentage: 20.0,
    //   proclamationNumber: "proclamation number: 45363829836345",
    //   minimumNumberOfBuyer: 23,
    //   maximumNumberOfBuyer: 15,
    //   bankInformation: ['bankInfo1', 'bankInfo2'],
    //   shareImage: ["asset/logo_image/goat.jpg"],
    //   unitSharePrice: 67.0,
    //   noOfShares: 50.0,
    //   divident: 60.0,
    //   minimumPaymentInPercent: 10.0,
    //   minimumNumberOfSharesToBuy: 9.0,
    //   maximumNumberOfSharesToBuy: 15.0,
    //   requirement: "requirement",
    //   description:
    //       "Habesha Breweries S.C Founded by 8,000 proud Ethiopian shareholders who were moved by the vision of reaching and connecting with Ethiopians, Habesha Breweries.",
    //   searchKeyWords: ['bankInfo1', 'bankInfo2'],
    //   // returnDividentTimeInDays: 56,
    //   timeToReturnRemainPayment: 20,
    //   // currancy: "currancy",
    // );
    ShareModel share = ShareModel(
      savingAccountPercentage: 12.5,
      proclamationNumber: "PRO123",
      minimumNumberOfBuyer: 5,
      maximumNumberOfBuyer: 20,
      bankInformation: ['Bank A', 'Bank B', 'Bank C'],
      shareImage: ['image1.jpg', 'image2.jpg'],
      unitSharePrice: 15.75,
      noOfShares: 500,
      divident: 7.2,
      minimumPaymentInPercent: 10.0,
      minimumNumberOfSharesToBuy: 1.0,
      maximumNumberOfSharesToBuy: 50.0,
      requirement: "Valid ID proof required",
      identification: "ABC123",
      companyID: "COMP456",
      description: "Invest in our company shares for great returns!",
      searchKeyWords: ['investment', 'shares', 'dividend'],
      returnDividentDescription: ["Yearly", "Biannually"],
      timeToReturnRemainPayment: 90,
      currency: "USD",
      dateAdded: "2024-05-18",
      isDeleted: false,
      isHidden: false,
    );
    CompanyProfileModel company = Provider.of<UserProvider>(context).getCompany;

    return Scaffold(
      drawer: (MediaQuery.of(context).size.width > phoneSize) ? null : NavBar(),
      appBar: (MediaQuery.of(context).size.width > phoneSize)
          ? null
          : AppBar(
              actions: const [
                Icon(Iconsax.notification),
                SizedBox(
                  width: 10,
                ),
                Icon(Iconsax.search_normal),
                SizedBox(
                  width: 20,
                )
              ],
              backgroundColor:
                  !dark ? SColors.lighGrey : SColors.homePageNavBar,

              // elevation: 1,
            ),
      body: (company.shareID == "")
          ? Center(
              child: ElevatedButton(
                  onPressed: () async {
                    (MediaQuery.of(context).size.width > phoneSize)
                        ? showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  actions: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      width: (MediaQuery.of(context)
                                                  .size
                                                  .width >
                                              phoneSize)
                                          ? MediaQuery.of(context).size.width -
                                              70
                                          : MediaQuery.of(context).size.width,
                                      height: (MediaQuery.of(context)
                                                  .size
                                                  .width >
                                              phoneSize)
                                          ? MediaQuery.of(context).size.height -
                                              80
                                          : MediaQuery.of(context).size.height -
                                              100,
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Add Share",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 18),
                                              ),
                                              IconButton(
                                                  onPressed: () => Navigator.of(
                                                          context,
                                                          rootNavigator: true)
                                                      .pop(),
                                                  icon: const Icon(
                                                    Icons.close,
                                                    color: Colors.red,
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
                                builder: (context) => const AddPost()));
                  },
                  child: Text("Add Share")),
            )
          : (MediaQuery.of(context).size.width > phoneSize)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   child: const CircleAvatar(
                              //     radius: 45,
                              //     backgroundImage:
                              //         AssetImage('asset/logo_image/goat.jpg'),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 14,
                              // ),
                              Container(
                                child: const Text(
                                  "Habesha Breweries S.C",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Icon(
                                    Iconsax.location,
                                    color: Colors.grey,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Text(
                                    "addis ababa",
                                    // style: STextTheme.lightTextTheme.bodySmall
                                    //     ?.copyWith(color: Colors.blue),
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Icon(
                                    Iconsax.location,
                                    color: Colors.grey,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Text(
                                    "brewery",
                                    // style: STextTheme.lightTextTheme.bodySmall
                                    //     ?.copyWith(color: Colors.blue),
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  share.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage(share.shareImage[0]))),
                              ),
                            ],
                          )),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              const SizedBox(
                                height: 70,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  ShareDetailElementWidget(
                                    title1: 'unit Share Price ',
                                    content: 'ETB(birr)',
                                    contentPrice: '${share.unitSharePrice}',
                                    title2: 'Number ',
                                    content2: '${share.maximumNumberOfBuyer}',
                                    contentPrice2:
                                        '${share.minimumNumberOfBuyer}',
                                  ),
                                  ShareDetailElementWidget(
                                    title1: 'number share ',
                                    content: '${share.noOfShares}',
                                    contentPrice: '200 units',
                                    title2: 'Divident  ',
                                    content2: '${share.divident}',
                                    contentPrice2:
                                        // '${share.returnDividentTimeInDays}',
                                        '',
                                  ),
                                  ShareDetailElementWidget(
                                    title1: 'min payment ',
                                    content: '${share.minimumPaymentInPercent}',
                                    contentPrice: '!/2',
                                    title2: 'no of share to buy ',
                                    content2:
                                        '${share.maximumNumberOfSharesToBuy}',
                                    contentPrice2:
                                        '${share.minimumNumberOfSharesToBuy}',
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.tick_circle,
                            // color: Colors.black,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 550,
                            child: Text(
                              share.proclamationNumber,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.tick_circle,
                            // color: Colors.black,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 550,
                            child: const Text(
                              "saving account",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Iconsax.arrow_down_14,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.tick_circle,
                            // color: Colors.black,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 550,
                            child: const Text(
                              "requirment",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Iconsax.arrow_down_14,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.tick_circle,
                            // color: Colors.black,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 550,
                            child: const Text(
                              "time to return remain payment",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Iconsax.arrow_down_14,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 45,
                          backgroundImage:
                              AssetImage('asset/logo_image/goat.jpg'),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const Text(
                          "Habesha Breweries S.C",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Iconsax.location,
                              color: Colors.grey,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              "addis ababa",
                              // style: STextTheme.lightTextTheme.bodySmall
                              //     ?.copyWith(color: Colors.blue),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(
                              Iconsax.location,
                              color: Colors.grey,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              "brewery",
                              // style: STextTheme.lightTextTheme.bodySmall
                              //     ?.copyWith(color: Colors.blue),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            share.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(share.shareImage[0]))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            ShareDetailElementWidget(
                              title1: 'unit Share Price ',
                              content: 'ETB(birr)',
                              contentPrice: '${share.unitSharePrice}',
                              title2: 'Number ',
                              content2: '${share.maximumNumberOfBuyer}',
                              contentPrice2: '${share.minimumNumberOfBuyer}',
                            ),
                            ShareDetailElementWidget(
                              title1: 'number share ',
                              content: '${share.noOfShares}',
                              contentPrice: '200 units',
                              title2: 'Divident  ',
                              content2: '${share.divident}',
                              // contentPrice2: '${share.returnDividentTimeInDays}',
                              contentPrice2: '',
                            ),
                            ShareDetailElementWidget(
                              title1: 'min payment ',
                              content: '${share.minimumPaymentInPercent}',
                              contentPrice: '!/2',
                              title2: 'no of share to buy ',
                              content2: '${share.maximumNumberOfSharesToBuy}',
                              contentPrice2:
                                  '${share.minimumNumberOfSharesToBuy}',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 70,
                              child: Text(
                                share.proclamationNumber,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 70,
                              child: const Text(
                                "saving account",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Iconsax.arrow_down_14,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 70,
                              child: const Text(
                                "requirment",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Iconsax.arrow_down_14,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 70,
                              child: const Text(
                                "time to return remain payment",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Iconsax.arrow_down_14,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}

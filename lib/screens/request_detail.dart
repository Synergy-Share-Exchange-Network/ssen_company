// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'package:ssen_company/Models/purchase_model.dart';

// import '../services/theme/text_theme.dart';

// class RequestDetailPage extends StatefulWidget {
//   const RequestDetailPage({super.key});

//   @override
//   State<RequestDetailPage> createState() => _RequestDetailPageState();
// }

// class _RequestDetailPageState extends State<RequestDetailPage> {
//       PurchaseModel purchase = PurchaseModel(
//       identification: "13",
//       firstName: "david ",
//       lastName: "nigus",
//       email: "dawitnigus@gmail.com",
//       nationality: "ethiopian",
//       region: "oromia",
//       subCity: "bishoftu",
//       phoneNumber: "0967547632",
//       sharePerPrice: 500,
//       numberOfShare: 40,
//       bankAccount: "1000006474537",
//       savingAccountAmount: "566",
//       signature: "13",
//       shareID: "14",
//       userID: "55",
//       companyID: "66",
//     );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Request Details'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Container(
//             width: 500,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 30,
//                       backgroundImage:
//                           NetworkImage(getImage(widget.company.logoImage[0])),
//                     ),
//                     SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.company.name,
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(widget.company.email),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(widget.company.phoneNumber),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Text(
//                       'Date:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text(widget.company.createdDay),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(8),
//                       child: Text(
//                         "Trade Lisense",
//                         style: STextTheme.lightTextTheme.headlineSmall,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: Image.network(
//                         getImage(widget.company.tradeLicense[0]),
//                         height: 250,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(8),
//                       child: Text(
//                         "Share Lisense",
//                         style: STextTheme.lightTextTheme.headlineSmall,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: Image.network(
//                         getImage(widget.company.shareSalesLicense[0]),
//                         height: 250,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 24),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         // Handle accept action
//                       },
//                       child: Text('Accept'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         _showDeclineDialog(context);
//                       },
//                       child: Text('Decline'),
//                       style: ElevatedButton.styleFrom(primary: Colors.red),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showDeclineDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Decline Request'),
//           content: TextField(
//             decoration: InputDecoration(
//               hintText: 'Enter reason for decline',
//             ),
//             maxLines: 3,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle decline action with reason
//                 Navigator.of(context).pop();
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_company/Models/purchase_model.dart';
import 'package:ssen_company/utils/constants/colors.dart';

import '../Models/company_profile_model.dart';
import '../services/theme/text_theme.dart';
import '../utils/constants.dart';
import '../utils/helper_function.dart';
import '../utils/utils.dart';

class RequestDetail extends StatelessWidget {
  const RequestDetail({Key? key, required this.purchase}) : super(key: key);
  // final CompanyProfileModel company;
  final PurchaseModel purchase;
  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   children: [
                //     CircleAvatar(
                //       radius: 30,
                //       backgroundImage:
                //           NetworkImage(getImage(company.logoImage[0])),
                //     ),
                //     SizedBox(width: 16),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           company.name,
                //           style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         Text(company.email),
                //         SizedBox(
                //           width: 10,
                //         ),
                //         Text(company.phoneNumber),
                //       ],
                //     ),
                //   ],
                // ),

                Text(
                  'Date:  ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 200,
                  width: 300,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:
                        dark ? SColors.darkContainer : SColors.lightContainer,
                    border: Border.all(
                      width: 3,
                      color:
                          dark ? SColors.darkContainer : SColors.lightContainer,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'number Of share',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "${purchase.numberOfShare}",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payed Amount',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "${purchase.payedamount} Birr",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Regiom',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "${purchase.region}",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Woreda',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "${purchase.woreda}",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kebele',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "${purchase.kebele}",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(purchase.date),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Kebele Id front",
                    style: STextTheme.lightTextTheme.headlineSmall,
                  ),
                ),
                MediaQuery.of(context).size.width > phoneSize
                    ? Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(
                              getImage(purchase.kebeleIDPhoto[0]),
                              height: 250,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(
                              getImage(purchase.kebeleIDPhoto[1]),
                              height: 250,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(
                              getImage(purchase.signature),
                              height: 250,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(
                              getImage(purchase.kebeleIDPhoto[0]),
                              height: 250,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(
                              getImage(purchase.kebeleIDPhoto[1]),
                              height: 250,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(
                              getImage(purchase.signature),
                              height: 250,
                            ),
                          ),
                        ],
                      ),
                SizedBox(height: 16),

                // SizedBox(height: 24),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     ElevatedButton(
                //       onPressed: () {
                //         acceptRequest(user, widget.company.identification);
                //       },
                //       child: Text('Accept'),
                //     ),
                //     ElevatedButton(
                //       onPressed: () {
                //         declineRequest(user, widget.company.identification);
                //       },
                //       child: Text('Decline'),
                //       style: ElevatedButton.styleFrom(primary: Colors.red),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

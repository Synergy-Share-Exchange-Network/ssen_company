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

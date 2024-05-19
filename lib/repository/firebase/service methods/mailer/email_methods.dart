// // import 'package:flutter/foundation.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
// // import 'package:mailer/smtp_server/gmail.dart';

// Future<void> sendEmail(String recipient, String subject, String body) async {
//   // await dotenv.load(fileName: ".env"); // Load environment variables
//   // final password = dotenv.env['EMAIL_PASSWORD'];

//   var username = 'synergyshares@gmail.com';
//   var token = 'zhzu ubec mijf gdjj';
//   // final smtpServer = gmailRelaySaslXoauth2(username, token);
//   SmtpServer smtpServer = gmail(username, token);
//   final message = Message()
//     ..from = Address(username, 'support@Synergyshareexchange')
//     ..recipients.add(Address(recipient))
//     ..subject = subject
//     ..html = body;
//   try {
//     final sendReport =
//         await send(message, smtpServer, timeout: const Duration(seconds: 15));
//     print('Email sent successfully: $sendReport');
//   } on MailerException catch (e) {
//     print('Error sending email: $e');
//   } catch (e) {
//     print('Unknown error: $e');
//   }
// }

// // void main(List<String> args) {
// //   print("in");
// //   // sendEmail(
// //   //     'synergyshares@gmail.com',
// //   //     'purchase confirmation',
// //   //     EmailTemplate.purchaseConfirmation('USER', 'user@email', 'Company X',
// //   //         '10', '2000', 'April 27, 2024', '20000', 'ave5156ed6'));
// //   sendEmail(
// //       "synergyshares@gmail.com",
// //       "Welcome!",
// //       EmailTemplate.companyWelcomeEmail(
// //           "Synergy", "Synergyshares@email.com", "wubet ", "Business sector"));
// //   print("Success");
// // }

import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/widgets.dart';
import 'package:intl/intl.dart';
// import 'package:qr_flutter/qr_flutter.dart';
import 'package:printing/printing.dart';
import 'package:ssen_company/utils/utils.dart';
import 'package:uuid/uuid.dart';
import 'package:ssen_company/Repository/firebase/model%20methods/firebase_company_profile_methods.dart';
import 'package:ssen_company/Repository/firebase/model%20methods/firebase_user_methods.dart';
import 'package:ssen_company/Models/purchase_model.dart';

Future<Uint8List> generateInvoice(
    PdfPageFormat pageFormat, Future<PurchaseModel> data) async {
  try {
    final purchaseModel = await data;
    final userData = await FirebaseUserMethods().read(purchaseModel.userID);
    final company =
        await FirebaseCompanyProfileMethods().read(purchaseModel.companyID);

    final backgroundImage = await _loadAssetImage('invoice_background.jpg');
    final logoImage =
        // await _loadAssetImage('invoice_background.jpg');
        await _loadNetworkImage(getImage(company.logoImage[0]));
    // final signatureImage = await _loadAssetImage('signature.jpg');
    // final qr =
    //     // await _loadAssetImage('invoice_background.jpg');
    //     await _loadNetworkImage(getImage(company.logoImage[0]));

// Use it like this:

    final signatureImage =
        await _loadNetworkImage(getImage(purchaseModel.signature));
    // final signatureImage = await _loadNetworkImage(
    //     // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80');
    //     'https://firebasestorage.googleapis.com/v0/b/synergy-share-exchange-network.appspot.com/o/sign%2FaGpTqtnI7VTvj49iglrMRtWmimT2%2Fimage%2F50e1de80-a4b7-1017-9494-67305cf29073%2FaGpTqtnI7VTvj49iglrMRtWmimT2?alt=media&token=6d7e9d82-0d71-47b7-919a-1d45b34fa73f');

    // print(purchaseModel.signature);
    if (userData.title.isEmpty) {
      userData.title == 'Mr/Ms';
    }
    final invoice = Invoice(
      numberOfShares: purchaseModel.numberOfShare,
      clientHouseno: purchaseModel.houseNumber,
      clientPostal: 'N/A',
      clientStreet: 'N/A',
      clientTitle: userData.title,
      clientName: '${purchaseModel.firstName} ${purchaseModel.lastName}',
      clientCompany: 'null',
      clientCitizenship: purchaseModel.nationality,
      clientRegion: purchaseModel.region,
      clientCity: purchaseModel.region,
      clientSubCity: purchaseModel.subCity,
      clientWoreda: purchaseModel.woreda,
      clientKebele: purchaseModel.kebele,
      clientPhone: purchaseModel.phoneNumber,
      clientEmail: purchaseModel.email,
      invoiceNumber: purchaseModel.identification,
      baseColor: PdfColors.blue,
      accentColor: PdfColors.yellow900,
      companyInfo: CompanyInfo(
        bankAcc: purchaseModel.bankAccount,
        companyName: company.name,
        companyAddress: company.locationDescription,
        contactNumber: company.phoneNumber,
        email: company.email,
        website: 'company',
        paymentInstructions:
            'Payment instructions: Wire transfer or ACH. Details on back side.',
        pricepershare: purchaseModel.sharePerPrice,
      ),
      signatureImage: signatureImage,
      logoImage: logoImage,
      // qr: qr,
    );

    return await invoice.buildPdf(pageFormat, backgroundImage);
  } catch (e) {
    print('Error generating invoice: $e');
    rethrow;
  }
}

Future<Uint8List> _loadAssetImage(String assetPath) async {
  final ByteData imageData = await rootBundle.load(assetPath);
  return imageData.buffer.asUint8List();
}

Future<Uint8List> _loadNetworkImage(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception(
          'Failed to load image from network with status code ${response.statusCode}');
    }
  } catch (e) {
    print('Error loading image: $e');
    // Handle error gracefully
    throw Exception('Failed to load image from network: $e');
  }
}

// Future<Uint8List> generateQrCode(String data) async {
//   final qrValidationResult = QrValidator.validate(
//     data: data,
//     version: QrVersions.auto,
//     errorCorrectionLevel: QrErrorCorrectLevel.L,
//   );
//   if (qrValidationResult.status == QrValidationStatus.valid) {
//     final qrCode = qrValidationResult.qrCode;
//     final painter = QrPainter.withQr(
//       qr: qrCode!,
//       // color: const Color(0xFF000000),
//       // emptyColor: const Color(0xFFFFFFFF),
//       gapless: true,
//     );
//     final image = await painter.toImage(200); // You can adjust the size
//     // final byteData = await image.toByteData(format: qrCode.);
//     return byteData!.buffer.asUint8List();
//   } else {
//     throw Exception('Could not generate QR code');
//   }
// }

class CompanyInfo {
  final String companyName;
  final String bankAcc;
  final String companyAddress;
  final String contactNumber;
  final double pricepershare;
  final String email;
  final String website;
  final String paymentInstructions;

  CompanyInfo({
    required this.companyName,
    required this.pricepershare,
    required this.companyAddress,
    required this.contactNumber,
    required this.email,
    required this.bankAcc,
    required this.website,
    required this.paymentInstructions,
  });
}

class Invoice {
  final double numberOfShares;
  final String clientTitle;
  final String clientName;
  final String clientCompany;
  final String clientCitizenship;
  final String clientCity;
  final String clientRegion;
  final String clientSubCity;
  final String clientWoreda;
  final String clientHouseno;
  final String clientPostal;
  final String clientStreet;
  final String clientKebele;
  final String clientPhone;
  final String clientEmail;
  final String invoiceNumber;
  final CompanyInfo companyInfo;
  final PdfColor baseColor;
  final PdfColor accentColor;
  final Uint8List signatureImage;
  final Uint8List logoImage;
  // final Uint8List qr;
  Invoice({
    required this.companyInfo,
    required this.numberOfShares,
    required this.clientTitle,
    required this.clientName,
    required this.clientCompany,
    required this.clientCitizenship,
    required this.clientCity,
    required this.clientHouseno,
    required this.clientPostal,
    required this.clientStreet,
    required this.clientRegion,
    required this.clientSubCity,
    required this.clientWoreda,
    required this.clientKebele,
    required this.clientPhone,
    required this.clientEmail,
    required this.invoiceNumber,
    required this.baseColor,
    required this.accentColor,
    required this.signatureImage,
    required this.logoImage,
    // required this.qr,
  });

  static const _darkColor = PdfColors.blueGrey800;
  static const _lightColor = PdfColors.white;

  PdfColor get _baseTextColor => baseColor.isLight ? _lightColor : _darkColor;

  PdfColor get _accentTextColor => baseColor.isLight ? _lightColor : _darkColor;

  String get pps => companyInfo.pricepershare.toString();
  // NumberFormat formatter = NumberFormat.decimalPatternDigits(
  //   locale: 'en_us',
  //   decimalDigits: 2,
  // );
  String get total =>
      // formatter.format(
      (numberOfShares * companyInfo.pricepershare).toString();

  Future<Uint8List> buildPdf(
      PdfPageFormat pageFormat, Uint8List backgroundImage) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageTheme: _buildTheme(
          PdfPageFormat.a4,
          await PdfGoogleFonts.montserratRegular(),
          await PdfGoogleFonts.montserratBold(),
          await PdfGoogleFonts.montserratItalic(),
          backgroundImage,
        ),
        build: (context) => [
          _contentHeader(context),
          pw.SizedBox(height: 50),
          _contentFooter(context),
          pw.SizedBox(height: 20),
        ],
      ),
    );

    return pdf.save();
  }

  pw.PageTheme _buildTheme(
    PdfPageFormat pageFormat,
    pw.Font base,
    pw.Font bold,
    pw.Font italic,
    Uint8List backgroundImage,
  ) {
    return pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData.withFont(
        base: base,
        bold: bold,
        italic: italic,
      ),
      buildBackground: (context) => pw.FullPage(
        ignoreMargins: true,
        child: pw.Image(pw.MemoryImage(backgroundImage), fit: pw.BoxFit.cover),
      ),
    );
  }

  pw.Widget _contentHeader(pw.Context context) {
    return pw.Stack(
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.SizedBox(width: 40),
                pw.ClipOval(
                  child: pw.Container(
                    width: 50,
                    height: 50,
                    child: pw.Image(pw.MemoryImage(logoImage),
                        fit: pw.BoxFit.cover),
                  ),
                ),
                pw.SizedBox(width: 20),
                pw.Text(
                  companyInfo.companyName,
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                    color: baseColor,
                  ),
                ),
              ],
            ),
            // pw.SizedBox(height: 25),
            pw.Container(
              child: pw.Row(
                children: [
                  pw.SizedBox(width: 300),
                  pw.Text(
                    invoiceNumber,
                    style: pw.TextStyle(
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                      color: baseColor,
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 32),
            _buildClientInfo(),
            pw.SizedBox(height: 10),
            _buildAddressSection(),
            pw.SizedBox(height: 8),
            _buildShareDetail(),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildClientInfo() {
    double widthVal;
    if (clientName.length <= 10) {
      widthVal = 260;
    } else if (clientName.length <= 20) {
      widthVal = 230;
    } else if (clientName.length <= 25) {
      widthVal = 180;
    } else {
      widthVal = 100;
    }
    return pw.Row(
      children: [
        pw.SizedBox(width: 15),
        pw.Text(clientTitle),
        pw.SizedBox(width: 35),
        pw.Text(clientName),
        pw.SizedBox(width: widthVal),
        pw.Text(clientCitizenship),
      ],
    );
  }

  pw.Widget _buildAddressSection() {
    double widthVal;
    if (clientRegion.length <= 10) {
      widthVal = 160;
    } else if (clientRegion.length <= 20) {
      widthVal = 100;
    } else if (clientRegion.length <= 25) {
      widthVal = 60;
    } else {
      widthVal = 40;
    }
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          children: [
            pw.SizedBox(width: 120),
            pw.Text(clientRegion),
            pw.SizedBox(width: widthVal),
            pw.Text(clientCity),
          ],
        ),
        pw.Row(
          children: [
            pw.SizedBox(height: 35, width: 50),
            pw.Text(clientSubCity),
            pw.SizedBox(width: 220),
            pw.Text('$clientWoreda / ( $clientKebele )'),
          ],
        ),
        pw.Row(
          children: [
            pw.SizedBox(width: 50),
            pw.Text(clientHouseno),
            pw.SizedBox(width: 150),
            pw.Text(clientPostal),
            pw.SizedBox(width: 180),
            pw.Text(clientStreet),
          ],
        ),
        pw.Row(children: [
          pw.SizedBox(height: 30),
          pw.SizedBox(width: 70),
          pw.Text(clientPhone),
          pw.SizedBox(width: 190),
          pw.Text('N/A'),
        ]),
        pw.Row(children: [
          pw.SizedBox(width: 60),
          pw.Text(clientEmail),
        ]),
      ],
    );
  }

  pw.Widget _buildShareDetail() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          children: [
            pw.SizedBox(width: 120),
            pw.Text('$numberOfShares'),
          ],
        ),
        pw.SizedBox(height: 20),
        pw.Row(
          children: [
            pw.SizedBox(width: 150),
            pw.Text(
                '$numberOfShares'), // Placeholder for the second number of shares
          ],
        ),
        pw.SizedBox(height: 5),
        pw.Row(
          children: [
            pw.Text(pps),
            pw.SizedBox(width: 270),
            pw.Text('Birr'),
            pw.SizedBox(width: 50),
            pw.Text(total),
          ],
        ),
        pw.SizedBox(height: 15),
        pw.Row(
          children: [
            pw.SizedBox(width: 150),
            pw.Text(companyInfo.companyName),
          ],
        ),
        pw.SizedBox(height: 10),
        pw.Row(
          children: [
            pw.SizedBox(width: 80),
            pw.Text(companyInfo.contactNumber),
          ],
        ),
        pw.SizedBox(height: 5),
        pw.Row(
          children: [
            pw.SizedBox(width: 80),
            pw.Text(companyInfo.bankAcc),
          ],
        ),
      ],
    );
  }

  pw.Widget _contentFooter(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 210),
        pw.Row(
          children: [
            pw.SizedBox(width: 100),
            pw.Text(clientName),
          ],
        ),
        pw.SizedBox(height: 10),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Image(
                      pw.MemoryImage(signatureImage),
                      width: 120,
                      height: 60,
                    ),
                  ],
                ),
                pw.SizedBox(height: 30),
                pw.Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    color: _darkColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

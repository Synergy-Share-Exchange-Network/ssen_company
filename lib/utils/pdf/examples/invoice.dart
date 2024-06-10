import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;
import '../../../Models/purchase_model.dart';
import '../../../Repository/firebase/model methods/firebase_user_methods.dart';
import '../../../Repository/firebase/model methods/firebase_company_profile_methods.dart';
import '../../../utils/utils.dart';

Future<Uint8List> generateInvoice(
    PdfPageFormat pageFormat, Future<PurchaseModel> data) async {
  try {
    final purchaseModel = await data;
    final userData = await FirebaseUserMethods().read(purchaseModel.userID);
    final company =
        await FirebaseCompanyProfileMethods().read(purchaseModel.companyID);

    final backgroundImageP1 =
        await _loadAssetImage('invoice_background_page1.jpg');
    final backgroundImageP2 =
        await _loadAssetImage('invoice_background_page2.jpg');
    // final logoImage = await _loadAssetImage('logo.png');
    // final signatureImage = await _loadAssetImage('signature.jpg');
    // final idCardImage1 = await _loadAssetImage('signature.jpg');
    // final idCardImage2 = await _loadAssetImage('signature.jpg');
    final logoImage =
        // await _loadAssetImage('invoice_background.jpg');
        await _loadNetworkImage(getImage(company.logoImage[0]));
    final signatureImage =
        await _loadNetworkImage(getImage(purchaseModel.signature));
    final idCardImage1 =
        await _loadNetworkImage(getImage(purchaseModel.kebeleIDPhoto[0]));
    final idCardImage2 =
        await _loadNetworkImage(getImage(purchaseModel.kebeleIDPhoto[1]));

    if (userData.title.isEmpty) {
      userData.title = 'Mr/Ms';
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
      idCardImage1: idCardImage1,
      idCardImage2: idCardImage2,
      date: purchaseModel.date,
    );

    return await invoice.buildPdf(
        pageFormat, backgroundImageP1, backgroundImageP2);
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
  final String date;
  final CompanyInfo companyInfo;
  final PdfColor baseColor;
  final PdfColor accentColor;
  final Uint8List signatureImage;
  final Uint8List logoImage;
  final Uint8List idCardImage1;
  final Uint8List idCardImage2;

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
    required this.date,
    required this.invoiceNumber,
    required this.baseColor,
    required this.accentColor,
    required this.signatureImage,
    required this.logoImage,
    required this.idCardImage1,
    required this.idCardImage2,
  });

  static const _darkColor = PdfColors.blueGrey800;
  static const _lightColor = PdfColors.white;

  PdfColor get _baseTextColor => baseColor.isLight ? _lightColor : _darkColor;

  PdfColor get _accentTextColor => baseColor.isLight ? _lightColor : _darkColor;

  String get pps => companyInfo.pricepershare.toString();

  String get total => (numberOfShares * companyInfo.pricepershare).toString();

  Future<Uint8List> buildPdf(PdfPageFormat pageFormat,
      Uint8List backgroundImageP1, Uint8List backgroundImageP2) async {
    final pdf = pw.Document();

    // Load a font to maintain consistency
    final font = await PdfGoogleFonts.montserratRegular();
    final _regularFont = await PdfGoogleFonts.montserratRegular();
    final _boldFont = await PdfGoogleFonts.montserratBold();
    final _italicFont = await PdfGoogleFonts.montserratItalic();

    // First page with first background image
    pdf.addPage(
      pw.Page(
        pageTheme: _buildTheme(PdfPageFormat.a4, backgroundImageP1, font),
        build: (context) => pw.Column(
          children: [
            _contentHeader(context, font, _boldFont),
            pw.SizedBox(height: 50),
            _contentFooter(context, font),
            pw.SizedBox(height: 20),
          ],
        ),
      ),
    );

    // Second page with second background image and different content
    pdf.addPage(
      pw.Page(
        pageTheme: _buildTheme(PdfPageFormat.a4, backgroundImageP2, font),
        build: (context) => pw.Column(
          children: [
            pw.SizedBox(height: 70),
            _contentSecondPage(context, font),
            // _contentFooter(context, font),
            pw.SizedBox(height: 20),
          ],
        ),
      ),
    );

    return pdf.save();
  }

  pw.PageTheme _buildTheme(
      PdfPageFormat pageFormat, Uint8List backgroundImage, pw.Font font) {
    return pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      buildBackground: (context) => pw.FullPage(
        ignoreMargins: true,
        child: pw.Image(pw.MemoryImage(backgroundImage), fit: pw.BoxFit.cover),
      ),
      // textStyle: pw.TextStyle(font: font),
    );
  }

  pw.Widget _contentHeader(pw.Context context, pw.Font font, pw.Font boldFont) {
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
                    // Making the title bold
                    color: baseColor,
                    font: boldFont,
                  ),
                ),
              ],
            ),
            pw.Container(
              child: pw.Row(
                children: [
                  pw.SizedBox(width: 300),
                  pw.Text(
                    invoiceNumber,
                    style: pw.TextStyle(
                      fontSize: 10,
                      // fontWeight: pw.FontWeight.bold,
                      color: baseColor,
                      font: boldFont,
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 32),
            _buildClientInfo(font),
            pw.SizedBox(height: 10),
            _buildAddressSection(font),
            pw.SizedBox(height: 8),
            _buildShareDetail(font),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildClientInfo(pw.Font font) {
    double widthVal;
    if (clientName.length <= 10) {
      widthVal = 270;
    } else if (clientName.length <= 20) {
      widthVal = 230;
    } else if (clientName.length <= 25) {
      widthVal = 180;
    } else {
      widthVal = 100;
    }
    return pw.Row(
      children: [
        pw.SizedBox(width: 10),
        pw.Text(clientTitle, style: pw.TextStyle(font: font)),
        pw.SizedBox(width: 35),
        pw.Text(clientName, style: pw.TextStyle(font: font)),
        pw.SizedBox(width: widthVal),
        pw.Text(clientCitizenship, style: pw.TextStyle(font: font)),
      ],
    );
  }

  pw.Widget _buildAddressSection(pw.Font font) {
    double widthVal;
    if (clientRegion.length <= 10) {
      widthVal = 160;
    } else if (clientRegion.length <= 20) {
      widthVal = 130;
    } else if (clientRegion.length <= 25) {
      widthVal = 100;
    } else {
      widthVal = 60;
    }
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          children: [
            pw.SizedBox(width: 120),
            pw.Text(clientRegion, style: pw.TextStyle(font: font)),
            pw.SizedBox(width: widthVal),
            pw.Text(clientCity, style: pw.TextStyle(font: font)),
          ],
        ),
        pw.Row(
          children: [
            pw.SizedBox(height: 35, width: 50),
            pw.Text(clientSubCity, style: pw.TextStyle(font: font)),
            pw.SizedBox(width: 220),
            pw.Text('$clientWoreda / ( $clientKebele )',
                style: pw.TextStyle(font: font)),
          ],
        ),
        pw.Row(
          children: [
            pw.SizedBox(width: 50),
            pw.Text(clientHouseno, style: pw.TextStyle(font: font)),
            pw.SizedBox(width: 150),
            pw.Text(clientPostal, style: pw.TextStyle(font: font)),
            pw.SizedBox(width: 180),
            pw.Text(clientStreet, style: pw.TextStyle(font: font)),
          ],
        ),
        pw.Row(children: [
          pw.SizedBox(height: 30),
          pw.SizedBox(width: 70),
          pw.Text(clientPhone, style: pw.TextStyle(font: font)),
          pw.SizedBox(width: 190),
          pw.Text('N/A', style: pw.TextStyle(font: font)),
        ]),
        pw.Row(children: [
          pw.SizedBox(width: 60),
          pw.Text(clientEmail, style: pw.TextStyle(font: font)),
        ]),
      ],
    );
  }

  pw.Widget _buildShareDetail(pw.Font font) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          children: [
            pw.SizedBox(width: 120),
            pw.Text('$numberOfShares', style: pw.TextStyle(font: font)),
          ],
        ),
        pw.SizedBox(height: 20),
        pw.Row(
          children: [
            pw.SizedBox(width: 150),
            pw.Text('$numberOfShares', style: pw.TextStyle(font: font)),
          ],
        ),
        pw.SizedBox(height: 5),
        pw.Row(
          children: [
            pw.Text(pps, style: pw.TextStyle(font: font)),
            pw.SizedBox(width: 270),
            pw.Text('Birr', style: pw.TextStyle(font: font)),
            pw.SizedBox(width: 50),
            pw.Text(total, style: pw.TextStyle(font: font)),
          ],
        ),
        pw.SizedBox(height: 15),
        pw.Row(
          children: [
            pw.SizedBox(width: 150),
            pw.Text(companyInfo.companyName, style: pw.TextStyle(font: font)),
          ],
        ),
        pw.SizedBox(height: 45),
        pw.Row(
          children: [
            pw.SizedBox(width: 20),
            pw.Text('Birr $total or Birr $total in Digits',
                style: pw.TextStyle(font: font)),
          ],
        ),
        pw.SizedBox(height: 5),
        // pw.Row(
        //   children: [
        //     pw.SizedBox(width: 80),
        //     pw.Text(companyInfo.bankAcc, style: pw.TextStyle(font: font)),
        //   ],
        // ),
      ],
    );
  }

  pw.Widget _contentFooter(pw.Context context, pw.Font font) {
    DateTime issuedDate = DateTime.parse(date);
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 120),
        pw.Row(
          children: [
            pw.SizedBox(width: 100),
            pw.Text('$clientTitle $clientName',
                style: pw.TextStyle(font: font)),
          ],
        ),
        pw.SizedBox(height: 10),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.only(left: 50),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Image(
                        pw.MemoryImage(signatureImage),
                        width: 110,
                        height: 60,
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 25),
                  pw.Text(
                    DateFormat.yMMMMd().format(issuedDate),
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      color: _darkColor,
                      font: font,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  pw.Widget _contentSecondPage(pw.Context context, pw.Font font) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 50),
          child: pw.Text('$clientTitle $clientName',
              style: pw.TextStyle(font: font)),
        ),
        pw.SizedBox(height: 10),
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 50),
          child: pw.Text(clientEmail, style: pw.TextStyle(font: font)),
        ),
        pw.SizedBox(height: 10),
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 50),
          child: pw.Text(clientPhone, style: pw.TextStyle(font: font)),
        ),
        pw.SizedBox(height: 30),
        pw.Center(
          // Wrap the column in a Center widget
          child: pw.Column(
            children: [
              pw.Container(
                width: 300,
                height: 150,
                child: pw.Image(pw.MemoryImage(idCardImage1),
                    fit: pw.BoxFit.cover),
              ),
              pw.SizedBox(height: 30),
              pw.Container(
                width: 300,
                height: 150,
                child: pw.Image(pw.MemoryImage(idCardImage2),
                    fit: pw.BoxFit.cover),
              ),
            ],
          ),
        ),
        // Add more content specific to the second page here.
      ],
    );
  }
}

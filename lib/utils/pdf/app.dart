import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:ssen_company/Models/purchase_model.dart';
import 'package:ssen_company/Repository/firebase/model%20methods/firebase_purchase_methods.dart';

// import 'data.dart';
import 'examples/invoice.dart';
// import 'invoice.dart'; // Import the invoice.dart file

class Pdf extends StatefulWidget {
  const Pdf({
    Key? key,
  }) : super(key: key);

  @override
  PdfState createState() => PdfState();
}

class PdfState extends State<Pdf> {
  PrintingInfo? printingInfo;
  final Future<PurchaseModel> _data =
      FirebasePurchaseMethods().read('20240608-1030-8223-8390-c0d521e00bb7');

  @override
  void initState() {
    super.initState();
    _init();
  }

  /// Fetches printing information.
  Future<void> _init() async {
    try {
      final info = await Printing.info();
      setState(() {
        printingInfo = info;
      });
    } catch (e) {
      print('Error initializing printing info: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error initializing printing info: $e'),
        ),
      );
    }
  }

  Future<void> _saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    try {
      final bytes = await build(pageFormat);
      final appDocDir = await getApplicationDocumentsDirectory();
      final appDocPath = appDocDir.path;
      final file = File('$appDocPath/document.pdf');
      print('Save as file ${file.path} ...');
      await file.writeAsBytes(bytes);
      await OpenFile.open(file.path);

      // Fluttertoast.showToast(
      //   msg: "PDF downloaded successfully!",
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM,
      //   timeInSecForIosWeb: 1,
      //   backgroundColor: Colors.green,
      //   textColor: Colors.white,
      //   fontSize: 16.0,
      // );
    } catch (e) {
      print('Error saving file: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving file: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;

    if (printingInfo == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Agreement'),
      ),
      body: PdfPreview(
        maxPageWidth: 700,
        build: (format) => generateInvoice(format,
            _data), // Use the generateInvoice function from invoice.dart
        actions: [
          PdfPreviewAction(
            icon: const Icon(Icons.save),
            onPressed: _saveAsFile,
          ),
        ],
      ),
    );
  }
}

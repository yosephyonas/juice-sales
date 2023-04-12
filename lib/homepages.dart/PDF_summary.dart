import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

import 'home.dart';

class SummaryScreen extends StatelessWidget {
  final String salesman;
  final String name;
  final String location;
  final String telephone;
  final int apple300ml;
  final double apple300mlprice;
  final int apple1000ml;
  final double apple1000mlprice;
  final int mango300ml;
  final double mango300mlprice;
  final int mango1000ml;
  final double mango1000mlprice;
  final int tuttifruit300ml;
  final double tuttifruit300mlprice;
  final int tuttifruit1000ml;
  final double tuttifruit1000mlprice;
  final int water;
  final double waterprice;
  bool isDelivered;

  SummaryScreen({
    required this.salesman,
    required this.name,
    required this.location,
    required this.telephone,
    required this.apple300ml,
    required this.apple1000ml,
    required this.mango300ml,
    required this.mango1000ml,
    required this.tuttifruit300ml,
    required this.tuttifruit1000ml,
    required this.water,
    this.isDelivered = false, required this.apple300mlprice, required this.apple1000mlprice, required this.mango300mlprice, required this.mango1000mlprice, required this.tuttifruit300mlprice, required this.tuttifruit1000mlprice, required this.waterprice,
  });

  Future<void> _generatePdfAndView(context) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: <pw.Widget>[
              pw.Text(
                "Client Information:",
                style: pw.TextStyle(
                  fontSize: 18.0,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.green800,
                ),
              ),
              pw.SizedBox(height: 8.0),
              pw.Text("Name: $salesman"),
              pw.SizedBox(height: 8.0),
              pw.Text("Name: $name"),
              pw.SizedBox(height: 8.0),
              pw.Text("Location: $location"),
              pw.SizedBox(height: 8.0),
              pw.Text("Telephone: $telephone"),
              pw.SizedBox(height: 16.0),
              pw.Text(
                "Order Information:",
                style: pw.TextStyle(
                  fontSize: 18.0,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.green800,
                ),
              ),
              pw.SizedBox(height: 8.0),
              pw.Text("Apple Juice 300ml: $apple300ml pcs"),
              pw.SizedBox(height: 8.0),
              pw.Text("Apple Juice 1000ml: $apple1000ml pcs"),
              pw.SizedBox(height: 8.0),
              pw.Text("Mango Juice 300ml: $mango300ml pcs"),
              pw.SizedBox(height: 8.0),
              pw.Text("Mango Juice 1000ml: $mango1000ml pcs"),
              pw.SizedBox(height: 8.0),
              pw.Text("Tutti Fruit Juice 1000ml: $tuttifruit300ml pcs"),
              pw.SizedBox(height: 8.0),
              pw.Text("Tutti Fruit 1000ml: $tuttifruit1000ml pcs"),
              pw.SizedBox(height: 8.0),
              pw.Text(" Water: $water pcs"),
            ],
          );
        },
      ),
    );

    final output = await Printing.layoutPdf(onLayout: (format) => pdf.save());

    await _uploadPdfToFirebase(output as List<int>);
  }

  Future<void> _uploadPdfToFirebase(List<int> pdfBytes) async {
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.pdf';
    final Reference ref = FirebaseStorage.instance.ref().child(fileName);
    final UploadTask uploadTask = ref.putData(Uint8List.fromList(pdfBytes));
    final TaskSnapshot downloadUrl = (await uploadTask.whenComplete(() {}));

    final String url = (await downloadUrl.ref.getDownloadURL());
    print("PDF Download URL: $url");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Summary',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text('Salesman: $salesman'),
              SizedBox(height: 8.0),
              Text('Name: $name'),
              SizedBox(height: 8.0),
              Text('Location: $location'),
              SizedBox(height: 8.0),
              Text('Telephone: $telephone'),
              SizedBox(height: 16.0),
              Text('Order Information:',
                  style:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              Text('Apple Juice 300ml: $apple300ml pcs'),
              SizedBox(height: 8.0),
              Text('Apple Juice 1000ml: $apple1000ml pcs'),
              SizedBox(height: 8.0),
              Text('Mango Juice 300ml: $mango300ml pcs'),
              SizedBox(height: 8.0),
              Text('Mango Juice 1000ml: $mango1000ml pcs'),
              SizedBox(height: 8.0),
              Text('Tutti Fruit Juice 1000ml: $tuttifruit300ml pcs'),
              SizedBox(height: 8.0),
              Text('Tutti Fruit 1000ml: $tuttifruit1000ml pcs'),
              SizedBox(height: 8.0),
              Text('Water: $water pcs'),
              SizedBox(height: 16.0),

              ElevatedButton(
                child: Text('Done'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JuiceSalesMenu()),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/basic.dart' as basic;

import 'package:googleapis/sheets/v4.dart';
import 'package:juice_sales/SignUp.dart/registration_screen.dart';


import 'package:googleapis_auth/auth_io.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:juice_sales/homepages.dart/PDF_summary.dart';

import '../main.dart';







class JuiceOrderPage extends StatefulWidget {
  @override
  _JuiceOrderPageState createState() => _JuiceOrderPageState();
}

class _JuiceOrderPageState extends State<JuiceOrderPage> {
  // Default order values
  int telephone = 0;
  int apple300mlOrder = 0;
  int apple300mlPrice = 0;
  int apple1000mlOrder = 0;
  int apple1000mlPrice = 0;
  int mango300mlOrder = 0;
  int mango300mlPrice = 0;
  int mango1000mlOrder = 0;
  int mango1000mlPrice = 0;
  int tuttifruit300mlOrder = 0;
  int tuttifruit300mlPrice = 0;
  int tuttifruit1000mlOrder = 0;
  int tuttifruit1000mlPrice = 0;
  int water500mlOrder = 0;
  int water500mlPrice = 0;



  // Text editing controllers for input boxes
  final telephoneController = TextEditingController();
  final apple300mlController = TextEditingController();
  final apple300mlpriceController = TextEditingController();
  final apple1000mlController = TextEditingController();
  final apple1000mlpriceController = TextEditingController();
  final mango300mlController = TextEditingController();
  final mango300mlpriceController = TextEditingController();
  final mango1000mlController = TextEditingController();
  final mango1000mlpriceController = TextEditingController();
  final tuttifruit300mlController = TextEditingController();
  final tuttifruit300mlpriceController = TextEditingController();
  final tuttifruit1000mlController = TextEditingController();
  final tuttifruit1000mlpriceController = TextEditingController();
  final water500mlController = TextEditingController();
  final water500mlpriceController = TextEditingController();
  final salesmanController = TextEditingController();
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final statusController = TextEditingController();



  get sheets => null;

  // Submit order function
  void submitOrder() {

  int telephone = int.parse(telephoneController.text);
  int apple300mlOrder = int.parse(apple300mlController.text);
  int apple300mlPrice = int.parse(apple300mlpriceController.text);
  int apple1000mlOrder = int.parse(apple1000mlController.text);
  int apple1000mlPrice = int.parse(apple1000mlpriceController.text);
  int mango300mlOrder = int.parse(mango300mlController.text);
  int mango300mlPrice = int.parse(mango300mlpriceController.text);
  int mango1000mlOrder = int.parse(mango1000mlController.text);
  int mango1000mlPrice = int.parse(mango1000mlpriceController.text);
  int tuttifruit300mlOrder = int.parse(tuttifruit300mlController.text);
  int tuttifruit300mlPrice = int.parse(tuttifruit300mlpriceController.text);
  int tuttifruit1000mlOrder = int.parse(tuttifruit1000mlController.text);
  int tuttifruit1000mlPrice = int.parse(tuttifruit1000mlpriceController.text);
  int water500mlOrder = int.parse(water500mlController.text);
  int water500mlPrice = int.parse(water500mlpriceController.text);
  String saleman = salesmanController.text;
  String name = nameController.text;
  String location = locationController.text;
  String status = statusController.text;


    // TODO: Implement order submission logic
    print(
        "Order submitted! saleman:$saleman, Name: $name, Location: $location, Telephone: $telephone, "
            "Apple 300ml: $apple300mlOrder,Apple 300ml Price: $apple300mlPrice, Apple 1000ml: $apple1000mlOrder,Apple 1000ml Price: $apple1000mlPrice, "
            "Mango 300ml: $mango300mlOrder,Mango 300ml Price: $mango300mlPrice, Mango 1000ml: $mango1000mlOrder, Mango 1000ml Price: $mango1000mlPrice,"
            "tuttifruit 300ml: $tuttifruit300mlOrder,tuttifruit 300ml Price: $tuttifruit300mlPrice, tuttifruit 1000ml: $tuttifruit1000mlOrder,tuttifruit 1000ml Price: $tuttifruit1000mlPrice,"
            "water: $water500mlOrder, Water Price: $water500mlPrice"
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Juice Order"),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Sales Representatives:",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      basic.Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: salesmanController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Client Information:",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      basic.Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      basic.Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: locationController,
                          decoration: InputDecoration(
                            labelText: 'location',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      basic.Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: telephoneController,
                          keyboardType: TextInputType
                              .number,
                          decoration: InputDecoration(
                            labelText: 'Telephone',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        "Order Information:",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "Apple Juice 300ml",
                            style: TextStyle(fontSize: 18.0),

                          ),
                          Row(

                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: apple300mlController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "pcs",
                                style: TextStyle(
                                    fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Row(

                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: apple300mlpriceController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "AOA",
                                style: TextStyle(
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,

                        children: [
                          Text(
                            "Apple Juice 1000ml",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: apple1000mlController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),

                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "pcs",
                                style: TextStyle(
                                    fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Row(

                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: apple1000mlpriceController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "AOA",
                                style: TextStyle(
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "Mango Juice 300ml",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: mango300mlController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "pcs",
                                style: TextStyle(
                                    fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Row(

                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: mango300mlpriceController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "AOA",
                                style: TextStyle(
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "Mango Juice 1000ml",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: mango1000mlController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "pcs",
                                style: TextStyle(
                                    fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Row(

                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: mango1000mlpriceController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "AOA",
                                style: TextStyle(
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 18.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "Tuttufrutti Juice 300ml",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: tuttifruit300mlController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "pcs",
                                style: TextStyle(
                                    fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Row(

                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: tuttifruit300mlpriceController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "AOA",
                                style: TextStyle(
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "Tuttifrutti Juice 1000ml",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: tuttifruit1000mlController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "pcs",
                                style: TextStyle(
                                    fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Row(

                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: tuttifruit1000mlpriceController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "AOA",
                                style: TextStyle(
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "Water",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: water500mlController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "pcs",
                                style: TextStyle(
                                    fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),


                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Row(

                            children: [
                              SizedBox(
                                width: 60.0,
                                child: TextField(
                                  controller: water500mlpriceController,
                                  keyboardType: TextInputType
                                      .number,
                                  inputFormatters: <
                                      TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                "AOA",
                                style: TextStyle(
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: ElevatedButton(


                          onPressed: () async {

                            final _credentials = ServiceAccountCredentials.fromJson({
                              // replace with your own service account credentials
                              'private_key': "-----BEGIN PRIVATE KEY-----\nMIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQC+x7Ftb9gKv/Sj\nPJDDmMZ5Yo97SA9BJC/zF2l3tWO4GruZ1Ui82NV8L2HBCI5AQEMw+m4B83QC2hbw\nuY/ki7Maud4/vjW9Yj5kUIaG3TkJexJrAk81yW2NShNsQ9jgzs5nOTLjMU5uVgTO\nixg0K5rbQJ/PxBuODyq1lczMsD5p5xG2riN2/AZATilyasKCvQHsRoLur7GsLLqM\nVdo7FSiTOAm6+5vQwq3q+ZlsCUHTim9nsoCQrRkqxCDNb4I1SFIlb93FMuB7UFZT\nL9mjyYqrNq+MupT56+tUUCEai7t9niCWuNZ5k+m6kBEQJhQaidnfzkQIdySSk7Tl\nCCKvcwCFAgMBAAECggEADVfqtziIIAJagjNJfcC4+wLzfaAl3vzAtMwppoODkLwf\n7GvAPWMeFWQ7/lQSnPhRqsKNQKouLkfiLF6SK55AvekLnCI54H/XVM1UB2lAJMNc\nn6rm7uBifuwULTGWoOyd/5a+0iif73QpPGf6nqWBHH4p3058TeSOLGqoixV1nBL8\nBcCuYE6E6ccrlXwmdmrrXMv71eGIbb2y54J7eYDySbPZi/MhhmCaf7k0CpLltBmr\nz/f/WcIVrH3ovOvizFe2qnsnP2wXqY8rseFKCHh0VMHeigl9NrKwDMCjjyBOq93A\n8JYdsqDHqUNR40WxLXMtmBIvVKjYM9HKvObkmDfooQKBgQDvJLJipSOKl21y9IaW\nyGsb2MBCp+jaxnOplpI1G+Q61BYhJxI3llJRdm3o7P/Ajq36xKm6IGSI9Z6wLDK6\nyPsIsiXzOBcgxOXCQKmPwgpA1qDf3YRKNOGwcLAQza7V3P/F/TWzCOFGTNpkR8Ve\nlkpBX/gnL2BISgnfbqON+e7UYQKBgQDMOknS1PN86eVXlLTpP8rzZfPumquDApcI\nJu6bq4uVgpV9MMFHb/o38Hpx8X11/M7x5j7q1pNLL/YqHYmWcbuMGIeMGwRQt5zJ\nbwaw/k0LoVUF9hyEesspgmUOJjHQPch9PDoAbEXiIZLtmtePPOGAOAa8MfpX08Hq\n3rLMW1jepQKBgArc7uF+QOQNxuH+65Iz3nGwYeNlPzWY6C4e8dtJvg9SDQNKhBBU\nWr7qk0mOYnu7v3lxr4gN6qMyDRhRmahUctrNRN4MgThy2UD+sPUfyllxpnMk29qH\nFm1uYQESZsu+MzwqKWNNlvYbjZwaioOmbg8ULfCRvVzrSBGHNBTB8rBhAn8vET/y\nVyHGqCEzDhKjrxAXCGgvlXXxu6cTOeXD+sUwr+fD8niY/jWsrr+Jgx5nEtye43Gc\nrddEfMk+64/KHGwc3Ypfv9o+wBJiWjQwlmsrQwNVXGM2JRatel/P4v2YAKU0N60m\na82vUA2MtSL44A8YfdEPjnUjyKnod2q9rk/NAoGBAOQTzV8c3q+xX9vW5Og4s/NX\nLVldICJb5mMSob5T04QZmYEdxlWnd7Ojh5e8463OAnuyglQx6/xLHdDbqJSFotaj\nsfsoj2JsMivKV5p3x0nk39HSZvChfHpPkBexbffzGytL52EasmKZ197tnfbUV0bm\nOVwMA2ZiC1MP7BKIe0wh\n-----END PRIVATE KEY-----\n",
                              'client_email': 'gsheet@canajoy-1d3e7.iam.gserviceaccount.com',
                              'client_id': '111163431414751811890',
                              'type': 'service_account',
                            });








                            final _scopes = [SheetsApi.spreadsheetsScope];
                            AutoRefreshingAuthClient? _client = await clientViaServiceAccount(_credentials, _scopes);
                            final _sheetsApi = SheetsApi(_client);


                            final sheetName = 'Sheet1';
                            final range = '$sheetName!A2:AC';
                            final apple300ml = int.tryParse(apple300mlController.text) ?? 0;
                            final apple300mlprice = double.tryParse(apple300mlpriceController.text) ?? 0;
                            final apple300mlTotal = apple300ml * apple300mlprice;
                            final apple1000ml = int.tryParse(apple1000mlController.text) ?? 0;
                            final apple1000mlprice = double.tryParse(apple1000mlpriceController.text) ?? 0;
                            final apple1000mlTotal = apple1000ml * apple1000mlprice;
                            final mango300ml = int.tryParse(mango300mlController.text) ?? 0;
                            final mango300mlprice = double.tryParse(mango300mlpriceController.text) ?? 0;
                            final mango300mlTotal = mango300ml * mango300mlprice;
                            final mango1000ml = int.tryParse(mango1000mlController.text) ?? 0;
                            final mango1000mlprice = double.tryParse(mango1000mlpriceController.text) ?? 0;
                            final mango1000mlTotal = mango1000ml * mango1000mlprice;
                            final tuttifruit300ml = int.tryParse(tuttifruit300mlController.text) ?? 0;
                            final tuttifruit300mlprice = double.tryParse(tuttifruit300mlController.text) ?? 0;
                            final tuttifruit300mlTotal = tuttifruit300ml * tuttifruit300mlprice;
                            final tuttifruit1000ml = int.tryParse(tuttifruit1000mlController.text) ?? 0;
                            final tuttifruit1000mlprice = double.tryParse(tuttifruit1000mlpriceController.text) ?? 0;
                            final tuttifruit1000mlTotal = tuttifruit1000ml * tuttifruit1000mlprice;
                            final water = int.tryParse(water500mlController.text) ?? 0;
                            final waterprice = double.tryParse(water500mlpriceController.text) ?? 0;
                            final waterTotal = water * waterprice;
                            final totalQuantity = apple300ml + apple1000ml + mango300ml + mango1000ml + tuttifruit300ml + tuttifruit1000ml + water;
                            final totalAmount = apple300mlTotal + apple1000mlTotal + mango300mlTotal + mango1000mlTotal + tuttifruit300mlTotal + tuttifruit1000mlTotal + waterTotal;

                            final values = [
                              [DateFormat('yyyy-MM-dd').format(DateTime.now()),salesmanController.text,nameController.text, locationController.text, telephoneController.text,
                                apple300mlController.text, apple300mlpriceController.text,apple1000mlController.text,apple1000mlpriceController.text,mango300mlController.text,mango300mlpriceController.text,
                                mango1000mlController.text,mango1000mlpriceController.text,tuttifruit300mlController.text,tuttifruit300mlpriceController.text,tuttifruit1000mlController.text,tuttifruit1000mlpriceController.text,
                                water500mlController.text,water500mlpriceController.text,'Pending',apple300mlTotal,apple1000mlTotal,mango300mlTotal,mango1000mlTotal,tuttifruit300mlTotal,tuttifruit1000mlTotal,waterTotal,totalQuantity,totalAmount,
                            ]
                            ];
                            final valueRange = ValueRange(values: values);

                            final response = await _sheetsApi.spreadsheets.values.append(
                              valueRange,
                              "1GXT_4eyvg-EtRYDjQzp7N5PCQGlf6I6sWRjG1lfv-aM",
                              range,
                              insertDataOption: 'INSERT_ROWS',
                              valueInputOption: 'USER_ENTERED',
                            );

                            print('Appended ${response.updates?.updatedRows} row(s) to $sheetName');
                            _client.close();
                            _client = null;



                            String saleman = salesmanController.text;
                            String name = nameController.text;
                            String location = locationController.text;
                            String telephone = telephoneController.text;



                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SummaryScreen(
                                  salesman: saleman,
                                  name: name,
                                  location: location,
                                  telephone: telephone,
                                  apple300ml: apple300ml,
                                  apple300mlprice:apple300mlprice,
                                  apple1000ml: apple1000ml,
                                  apple1000mlprice: apple1000mlprice,
                                  mango300ml: mango300ml,
                                  mango300mlprice: mango300mlprice,
                                  mango1000ml: mango1000ml,
                                  mango1000mlprice: mango1000mlprice,
                                  tuttifruit300ml: tuttifruit300ml,
                                  tuttifruit300mlprice: tuttifruit300mlprice,
                                  tuttifruit1000ml: tuttifruit1000ml,
                                  tuttifruit1000mlprice: tuttifruit1000mlprice,
                                  water: water,
                                  waterprice: waterprice,
                                ),
                              ),
                            );


                          },
                          child: Text("Submit Order"),
                        ),
                      )
                    ]
                )
            )
        )
    );
  }
}


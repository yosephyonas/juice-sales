import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MyHomePage extends StatefulWidget {
  final List<dynamic> data;

  const MyHomePage({Key? key, required this.data}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  late List<dynamic> _data;
  late String _searchTerm;

  final _scopes = [sheets.SheetsApi.spreadsheetsReadonlyScope];
  final _credentials = ServiceAccountCredentials.fromJson({
    'private_key': "-----BEGIN PRIVATE KEY-----\nMIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQC+x7Ftb9gKv/Sj\nPJDDmMZ5Yo97SA9BJC/zF2l3tWO4GruZ1Ui82NV8L2HBCI5AQEMw+m4B83QC2hbw\nuY/ki7Maud4/vjW9Yj5kUIaG3TkJexJrAk81yW2NShNsQ9jgzs5nOTLjMU5uVgTO\nixg0K5rbQJ/PxBuODyq1lczMsD5p5xG2riN2/AZATilyasKCvQHsRoLur7GsLLqM\nVdo7FSiTOAm6+5vQwq3q+ZlsCUHTim9nsoCQrRkqxCDNb4I1SFIlb93FMuB7UFZT\nL9mjyYqrNq+MupT56+tUUCEai7t9niCWuNZ5k+m6kBEQJhQaidnfzkQIdySSk7Tl\nCCKvcwCFAgMBAAECggEADVfqtziIIAJagjNJfcC4+wLzfaAl3vzAtMwppoODkLwf\n7GvAPWMeFWQ7/lQSnPhRqsKNQKouLkfiLF6SK55AvekLnCI54H/XVM1UB2lAJMNc\nn6rm7uBifuwULTGWoOyd/5a+0iif73QpPGf6nqWBHH4p3058TeSOLGqoixV1nBL8\nBcCuYE6E6ccrlXwmdmrrXMv71eGIbb2y54J7eYDySbPZi/MhhmCaf7k0CpLltBmr\nz/f/WcIVrH3ovOvizFe2qnsnP2wXqY8rseFKCHh0VMHeigl9NrKwDMCjjyBOq93A\n8JYdsqDHqUNR40WxLXMtmBIvVKjYM9HKvObkmDfooQKBgQDvJLJipSOKl21y9IaW\nyGsb2MBCp+jaxnOplpI1G+Q61BYhJxI3llJRdm3o7P/Ajq36xKm6IGSI9Z6wLDK6\nyPsIsiXzOBcgxOXCQKmPwgpA1qDf3YRKNOGwcLAQza7V3P/F/TWzCOFGTNpkR8Ve\nlkpBX/gnL2BISgnfbqON+e7UYQKBgQDMOknS1PN86eVXlLTpP8rzZfPumquDApcI\nJu6bq4uVgpV9MMFHb/o38Hpx8X11/M7x5j7q1pNLL/YqHYmWcbuMGIeMGwRQt5zJ\nbwaw/k0LoVUF9hyEesspgmUOJjHQPch9PDoAbEXiIZLtmtePPOGAOAa8MfpX08Hq\n3rLMW1jepQKBgArc7uF+QOQNxuH+65Iz3nGwYeNlPzWY6C4e8dtJvg9SDQNKhBBU\nWr7qk0mOYnu7v3lxr4gN6qMyDRhRmahUctrNRN4MgThy2UD+sPUfyllxpnMk29qH\nFm1uYQESZsu+MzwqKWNNlvYbjZwaioOmbg8ULfCRvVzrSBGHNBTB8rBhAn8vET/y\nVyHGqCEzDhKjrxAXCGgvlXXxu6cTOeXD+sUwr+fD8niY/jWsrr+Jgx5nEtye43Gc\nrddEfMk+64/KHGwc3Ypfv9o+wBJiWjQwlmsrQwNVXGM2JRatel/P4v2YAKU0N60m\na82vUA2MtSL44A8YfdEPjnUjyKnod2q9rk/NAoGBAOQTzV8c3q+xX9vW5Og4s/NX\nLVldICJb5mMSob5T04QZmYEdxlWnd7Ojh5e8463OAnuyglQx6/xLHdDbqJSFotaj\nsfsoj2JsMivKV5p3x0nk39HSZvChfHpPkBexbffzGytL52EasmKZ197tnfbUV0bm\nOVwMA2ZiC1MP7BKIe0wh\n-----END PRIVATE KEY-----\n",
    'client_email': 'gsheet@canajoy-1d3e7.iam.gserviceaccount.com',
    'client_id': '111163431414751811890',
    'type': 'service_account',
  });



  @override
  void initState() {
    super.initState();
    _data = widget.data;
    _searchTerm = '';
    _fetchData();
  }

  Future<void> _fetchData() async {
    final client = await clientViaServiceAccount(_credentials, _scopes);
    final spreadsheetId = '1GXT_4eyvg-EtRYDjQzp7N5PCQGlf6I6sWRjG1lfv-aM';
    const range = 'Sheet1!A2:AC';
    final response = await sheets.SheetsApi(client).spreadsheets.values.get(spreadsheetId, range);
    setState(() {
      _data = response.values!;
    });

    client.close();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchTerm = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                Text("Search Term: $_searchTerm"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (BuildContext context, int index) {
                // Filter the rows that match the search term
                if (_searchTerm.isNotEmpty &&
                    !_data[index]
                        .toString()
                        .toLowerCase()
                        .contains(_searchTerm.toLowerCase())) {
                  return Container();
                }

                return TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RowDetailsPage(row: _data[index]),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white38),
                  ),
                  child: ListTile(
                    title: Text(
                      _data[index][1],
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _data[index][0],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Text(
                          _data[index][2],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _data[index][19] == 'Delivered'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }

}


class RowDetailsPage extends StatelessWidget {
  final List<dynamic> row;

  const RowDetailsPage({Key? key, required this.row}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Row Details',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Date: ${row[0]}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Set the text color to blue
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Sales Man: ${row[1]}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange, // Set the text color to orange
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Client Name: ${row[2]}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple, // Set the text color to purple
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Location: ${row[3]}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.green, // Set the text color to green
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Tel. Number: ${row[4]}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Set the text color to red
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Apple 300ml: ${row[5]}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown, // Set the text color to brown
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Apple 1000ml: ${row[6]}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown, // Set the text color to brown
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Mango 300ml: ${row[7]}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange, // Set the text color to deep orange
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Mango 1000ml: ${row[8]}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange, // Set the text color to deep orange
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Tutti Fruit 300ml: ${row[9]}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal, // Set the text color to teal
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Tutti Fruit 1000ml: ${row[10]}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal, // Set the text color to teal
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Water: ${row[11]}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Set the text color to red accent
                letterSpacing: 1.2,

              ),
            ),
            ElevatedButton(
              onPressed: () => _generatePdfAndView(context),
              child: Text('Generate PDF'),
            ),
          ],

        ),
      ),
    );
  }

  Future<void> _generatePdfAndView(context) async {
    final pdf = pw.Document();
    final bytes = await rootBundle.load('assets/logo.png');
    final image = pw.MemoryImage(bytes.buffer.asUint8List());



    pdf.addPage(
        pw.Page(
            build: (context) {
              return pw.Column(
  crossAxisAlignment: pw.CrossAxisAlignment.start,
  children: <pw.Widget>[
              pw.Positioned(
                top: 0,
                left: 0,
                child: pw.Transform.scale(
                  scale: 0.3,
                  child: pw.Image(image),
                ),
              ),

  // Add company logo
  pw.Row(
  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  children: <pw.Widget>[
    // replace `yourCompanyLogo` with your actual logo image
  pw.Text(
  "Canaan South Comerico gerl LDA",
  style: pw.TextStyle(
  fontSize: 18.0,
  fontWeight: pw.FontWeight.bold,
  color: PdfColors.green800,
  ),
  ),
  ],
  ),
  pw.SizedBox(height: 16.0),
  // Add company information
  pw.Text(
  "Address: RUa do Canal de Agu,Viana-Kukuxi\nLuanda, State Zip\nPhone: 926-295-736/927980707\nEmail: info@canaansouth.com\nContribunte: 5000092770",
  style: pw.TextStyle(
  fontSize: 12.0,
  color: PdfColors.grey800,
  ),
  ),
  pw.SizedBox(height: 16.0),
  pw.Text(
  "Client Information:",
  style: pw.TextStyle(
  fontSize: 18.0,
  fontWeight: pw.FontWeight.bold,
  color: PdfColors.green800,
  ),
  ),
  pw.SizedBox(height: 8.0),
  // Add client information
  pw.Text("Date: ${row[0]}"),
  pw.SizedBox(height: 8.0),
  pw.Text("Sales Man Name: ${row[1]}"),
  pw.SizedBox(height: 8.0),
  pw.Text("Name: ${row[2]}"),
  pw.SizedBox(height: 8.0),
  pw.Text("Location:${row[3]}"),
  pw.SizedBox(height: 8.0),
  pw.Text("Telephone: ${row[4]}"),
  pw.SizedBox(height: 16.0),
    pw.Text(
      "Order Information:",
      style: pw.TextStyle(
        fontSize: 18.0,
        fontWeight: pw.FontWeight.bold,
        color: PdfColors.green800,
      ),
    ),

    pw.Table.fromTextArray(
      border: null,
      headers: ['Product', 'Quantity', 'Price', 'Amount'],
      headerStyle: pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
      ),
      cellStyle: pw.TextStyle(
        color: PdfColors.blue,
        fontStyle: pw.FontStyle.italic,
      ),
              data: [
              ['Apple Juice 300ml', '${row[5]} pcs', '${row[6]} AOA','${row[20]} AOA'],
              ['Apple Juice 1000ml', '${row[7]} pcs', '${row[8]} AOA','${row[21]} AOA'],
              ['Mango Juice 300ml', '${row[9]} pcs', '${row[10]} AOA','${row[22]} AOA'],
              ['Mango Juice 1000ml', '${row[11]} pcs', '${row[12]} AOA','${row[23]} AOA'],
              ['Tutti Fruit Juice 300ml', '${row[13]} pcs', '${row[14]} AOA','${row[24]} AOA'],
              ['Tutti Fruit 1000ml', '${row[15]} pcs', '${row[16]} AOA','${row[25]} AOA'],
              ['Water', '${row[17]} pcs', '${row[18]} AOA','${row[26]} AOA'],
                ['Total', '${row[27]} pcs', '','${row[28]} AOA'],
              ],
              ),
    pw.SizedBox(height: 50.0),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Prepared by: ______________',
                    style: pw.TextStyle(fontSize: 12.0),
                  ),
                  pw.Text(
                    'Checked by: ______________',
                    style: pw.TextStyle(fontSize: 12.0),
                  ),
                  pw.Text(
                    'Customer by: ______________',
                    style: pw.TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
  ]);

            }
    ));
    await Printing.layoutPdf(onLayout: (format) => pdf.save());



  }

}

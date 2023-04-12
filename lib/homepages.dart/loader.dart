import 'package:flutter/material.dart';
import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:googleapis_auth/auth_io.dart';
import 'package:flutter/services.dart' show rootBundle;

class LoaderPage extends StatefulWidget {
  @override
  _LoaderPageState createState() => _LoaderPageState();
}

class _LoaderPageState extends State<LoaderPage> {
  bool isDelivered = false;

  final _scopes = [sheets.SheetsApi.spreadsheetsReadonlyScope];
  final _credentials = ServiceAccountCredentials.fromJson({
    'private_key': "-----BEGIN PRIVATE KEY-----\nMIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQC+x7Ftb9gKv/Sj\nPJDDmMZ5Yo97SA9BJC/zF2l3tWO4GruZ1Ui82NV8L2HBCI5AQEMw+m4B83QC2hbw\nuY/ki7Maud4/vjW9Yj5kUIaG3TkJexJrAk81yW2NShNsQ9jgzs5nOTLjMU5uVgTO\nixg0K5rbQJ/PxBuODyq1lczMsD5p5xG2riN2/AZATilyasKCvQHsRoLur7GsLLqM\nVdo7FSiTOAm6+5vQwq3q+ZlsCUHTim9nsoCQrRkqxCDNb4I1SFIlb93FMuB7UFZT\nL9mjyYqrNq+MupT56+tUUCEai7t9niCWuNZ5k+m6kBEQJhQaidnfzkQIdySSk7Tl\nCCKvcwCFAgMBAAECggEADVfqtziIIAJagjNJfcC4+wLzfaAl3vzAtMwppoODkLwf\n7GvAPWMeFWQ7/lQSnPhRqsKNQKouLkfiLF6SK55AvekLnCI54H/XVM1UB2lAJMNc\nn6rm7uBifuwULTGWoOyd/5a+0iif73QpPGf6nqWBHH4p3058TeSOLGqoixV1nBL8\nBcCuYE6E6ccrlXwmdmrrXMv71eGIbb2y54J7eYDySbPZi/MhhmCaf7k0CpLltBmr\nz/f/WcIVrH3ovOvizFe2qnsnP2wXqY8rseFKCHh0VMHeigl9NrKwDMCjjyBOq93A\n8JYdsqDHqUNR40WxLXMtmBIvVKjYM9HKvObkmDfooQKBgQDvJLJipSOKl21y9IaW\nyGsb2MBCp+jaxnOplpI1G+Q61BYhJxI3llJRdm3o7P/Ajq36xKm6IGSI9Z6wLDK6\nyPsIsiXzOBcgxOXCQKmPwgpA1qDf3YRKNOGwcLAQza7V3P/F/TWzCOFGTNpkR8Ve\nlkpBX/gnL2BISgnfbqON+e7UYQKBgQDMOknS1PN86eVXlLTpP8rzZfPumquDApcI\nJu6bq4uVgpV9MMFHb/o38Hpx8X11/M7x5j7q1pNLL/YqHYmWcbuMGIeMGwRQt5zJ\nbwaw/k0LoVUF9hyEesspgmUOJjHQPch9PDoAbEXiIZLtmtePPOGAOAa8MfpX08Hq\n3rLMW1jepQKBgArc7uF+QOQNxuH+65Iz3nGwYeNlPzWY6C4e8dtJvg9SDQNKhBBU\nWr7qk0mOYnu7v3lxr4gN6qMyDRhRmahUctrNRN4MgThy2UD+sPUfyllxpnMk29qH\nFm1uYQESZsu+MzwqKWNNlvYbjZwaioOmbg8ULfCRvVzrSBGHNBTB8rBhAn8vET/y\nVyHGqCEzDhKjrxAXCGgvlXXxu6cTOeXD+sUwr+fD8niY/jWsrr+Jgx5nEtye43Gc\nrddEfMk+64/KHGwc3Ypfv9o+wBJiWjQwlmsrQwNVXGM2JRatel/P4v2YAKU0N60m\na82vUA2MtSL44A8YfdEPjnUjyKnod2q9rk/NAoGBAOQTzV8c3q+xX9vW5Og4s/NX\nLVldICJb5mMSob5T04QZmYEdxlWnd7Ojh5e8463OAnuyglQx6/xLHdDbqJSFotaj\nsfsoj2JsMivKV5p3x0nk39HSZvChfHpPkBexbffzGytL52EasmKZ197tnfbUV0bm\nOVwMA2ZiC1MP7BKIe0wh\n-----END PRIVATE KEY-----\n",
    'client_email': 'gsheet@canajoy-1d3e7.iam.gserviceaccount.com',
    'client_id': '111163431414751811890',
    'type': 'service_account',
  });

  List<List<dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
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
    // Filter the _data list to show only pending orders
    final pendingOrders = _data.where((row) => row[19] == 'Pending').toList();

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
    backgroundColor: Colors.green, // Set the background color of the app bar
    ),
    body: ListView.builder(
    itemCount: pendingOrders.length,
    itemBuilder: (BuildContext context, int index) {
    final row = pendingOrders[index];

    return TextButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => RowDetailsPage(row: row)),
    );
    },
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white38), // Set the background color of the text button
    ),
        child: ListTile(
          title: Text(
            row[1],
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.green, // Set the text color of the title to white
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                row[0],
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.deepOrange, // Set the text color of the subtitle to grey
                ),
              ),
              Text(
                row[2],
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.brown, // Set the text color of the subtitle to grey
                ),
              ),
            ],
          ),
        )

    );
      },
    ),
    );
  }
}


class RowDetailsPage extends StatefulWidget {
  final List<dynamic> row;

  const RowDetailsPage({Key? key, required this.row}) : super(key: key);

  @override
  _RowDetailsPageState createState() => _RowDetailsPageState();
}

class _RowDetailsPageState extends State<RowDetailsPage> {
  String _status = "Pending"; // initial status

  final _scopes = [sheets.SheetsApi.spreadsheetsScope];
  final _credentials = ServiceAccountCredentials.fromJson({
    'private_key': "-----BEGIN PRIVATE KEY-----\nMIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQC+x7Ftb9gKv/Sj\nPJDDmMZ5Yo97SA9BJC/zF2l3tWO4GruZ1Ui82NV8L2HBCI5AQEMw+m4B83QC2hbw\nuY/ki7Maud4/vjW9Yj5kUIaG3TkJexJrAk81yW2NShNsQ9jgzs5nOTLjMU5uVgTO\nixg0K5rbQJ/PxBuODyq1lczMsD5p5xG2riN2/AZATilyasKCvQHsRoLur7GsLLqM\nVdo7FSiTOAm6+5vQwq3q+ZlsCUHTim9nsoCQrRkqxCDNb4I1SFIlb93FMuB7UFZT\nL9mjyYqrNq+MupT56+tUUCEai7t9niCWuNZ5k+m6kBEQJhQaidnfzkQIdySSk7Tl\nCCKvcwCFAgMBAAECggEADVfqtziIIAJagjNJfcC4+wLzfaAl3vzAtMwppoODkLwf\n7GvAPWMeFWQ7/lQSnPhRqsKNQKouLkfiLF6SK55AvekLnCI54H/XVM1UB2lAJMNc\nn6rm7uBifuwULTGWoOyd/5a+0iif73QpPGf6nqWBHH4p3058TeSOLGqoixV1nBL8\nBcCuYE6E6ccrlXwmdmrrXMv71eGIbb2y54J7eYDySbPZi/MhhmCaf7k0CpLltBmr\nz/f/WcIVrH3ovOvizFe2qnsnP2wXqY8rseFKCHh0VMHeigl9NrKwDMCjjyBOq93A\n8JYdsqDHqUNR40WxLXMtmBIvVKjYM9HKvObkmDfooQKBgQDvJLJipSOKl21y9IaW\nyGsb2MBCp+jaxnOplpI1G+Q61BYhJxI3llJRdm3o7P/Ajq36xKm6IGSI9Z6wLDK6\nyPsIsiXzOBcgxOXCQKmPwgpA1qDf3YRKNOGwcLAQza7V3P/F/TWzCOFGTNpkR8Ve\nlkpBX/gnL2BISgnfbqON+e7UYQKBgQDMOknS1PN86eVXlLTpP8rzZfPumquDApcI\nJu6bq4uVgpV9MMFHb/o38Hpx8X11/M7x5j7q1pNLL/YqHYmWcbuMGIeMGwRQt5zJ\nbwaw/k0LoVUF9hyEesspgmUOJjHQPch9PDoAbEXiIZLtmtePPOGAOAa8MfpX08Hq\n3rLMW1jepQKBgArc7uF+QOQNxuH+65Iz3nGwYeNlPzWY6C4e8dtJvg9SDQNKhBBU\nWr7qk0mOYnu7v3lxr4gN6qMyDRhRmahUctrNRN4MgThy2UD+sPUfyllxpnMk29qH\nFm1uYQESZsu+MzwqKWNNlvYbjZwaioOmbg8ULfCRvVzrSBGHNBTB8rBhAn8vET/y\nVyHGqCEzDhKjrxAXCGgvlXXxu6cTOeXD+sUwr+fD8niY/jWsrr+Jgx5nEtye43Gc\nrddEfMk+64/KHGwc3Ypfv9o+wBJiWjQwlmsrQwNVXGM2JRatel/P4v2YAKU0N60m\na82vUA2MtSL44A8YfdEPjnUjyKnod2q9rk/NAoGBAOQTzV8c3q+xX9vW5Og4s/NX\nLVldICJb5mMSob5T04QZmYEdxlWnd7Ojh5e8463OAnuyglQx6/xLHdDbqJSFotaj\nsfsoj2JsMivKV5p3x0nk39HSZvChfHpPkBexbffzGytL52EasmKZ197tnfbUV0bm\nOVwMA2ZiC1MP7BKIe0wh\n-----END PRIVATE KEY-----\n",
    'client_email': 'gsheet@canajoy-1d3e7.iam.gserviceaccount.com',
    'client_id': '111163431414751811890',
    'type': 'service_account',
  });

  Future<void> _updateData() async {
    final client = await clientViaServiceAccount(_credentials, _scopes);
    final spreadsheetId = '1GXT_4eyvg-EtRYDjQzp7N5PCQGlf6I6sWRjG1lfv-aM';
    final range = 'Sheet1!T:T';
    final valueRange = sheets.ValueRange.fromJson({
      'range': range,
      'majorDimension': 'COLUMNS',
      'values': [
        [_status],
      ],
    });
    await sheets.SheetsApi(client).spreadsheets.values.update(
      valueRange, spreadsheetId, range,
      valueInputOption: 'USER_ENTERED',
    );
    client.close();
  }




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
    'Date: ${widget.row[0]}',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
        letterSpacing: 1.2,
      ),
    ),
    SizedBox(height: 10.0),
    Text(
    'Sales Man: ${widget.row[1]}',
    style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.orange,
    letterSpacing: 1.2,
    ),
    ),
    SizedBox(height: 10.0),
    Text(
    'Client Name: ${widget.row[2]}',
    style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.purple,
    letterSpacing: 1.2,
    ),
    ),
    SizedBox(height: 10.0),
    Text(
    'Location: ${widget.row[3]}',
    style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.green,
    letterSpacing: 1.2,
    ),
    ),
    SizedBox(height: 10.0),
    Text(
    'Tel. Number: ${widget.row[4]}',
    style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.red,
    letterSpacing: 1.2,
    ),
    ),
    SizedBox(height: 10.0),
    Text(
    'Apple 300ml: ${widget.row[5]}',
    style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.brown,
    letterSpacing: 1.2,
    ),
    ),
    SizedBox(height: 10.0),
    Text(
    'Apple 1000ml: ${widget.row[7]}',
    style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.brown,
    letterSpacing: 1.2,
    ),
    ),
    SizedBox(height: 10.0),
    Text(
    'Mango 300ml: ${widget.row[9]}',
    style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.deepOrange,
    letterSpacing: 1.2,
    ),
    ),
    SizedBox(height: 10.0),
    Text(
    'Mango 1000ml: ${widget.row[11]}',
    style: TextStyle(
    fontSize: 20.0,
    fontWeight:          FontWeight.bold,
    color: Colors.deepOrange,
    letterSpacing: 1.2,
    ),
    ),
        Text(
          'Tutti Fruit 300ml: ${widget.row[13]}',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight:          FontWeight.bold,
            color: Colors.deepOrange,
            letterSpacing: 1.2,
          ),
        ),
        Text(
          'Tutti Fruit 1000ml: ${widget.row[15]}',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight:          FontWeight.bold,
            color: Colors.deepOrange,
            letterSpacing: 1.2,
          ),
        ),
        Text(
          'Water 500ml: ${widget.row[17]}',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight:          FontWeight.bold,
            color: Colors.deepOrange,
            letterSpacing: 1.2,
          ),
        ),
    SizedBox(height: 10.0),
    Text(
    'Status: ${widget.row[19]}', // display the status
    style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.blueGrey,
    letterSpacing: 1.2,
    ),
    ),
    SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _status = "Delivered"; // change status to Delivered
            });
            _updateData(); // update the status in the Google Sheet
          },
          child: Text('Delivered'),
        ),
    ],
    ),
    ),
    );
  }
}

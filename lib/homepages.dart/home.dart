import 'package:flutter/material.dart';
import 'package:juice_sales/homepages.dart/OrderSummaryScreen.dart';
import 'package:juice_sales/homepages.dart/chart.dart';
import 'package:juice_sales/homepages.dart/reports.dart';
import 'package:juice_sales/homepages.dart/stocks.dart';

import 'loader.dart';

class JuiceSalesMenu extends StatefulWidget {
  const JuiceSalesMenu({Key? key}) : super(key: key);

  @override
  State<JuiceSalesMenu> createState() => _JuiceSalesMenuState();
}

class _JuiceSalesMenuState extends State<JuiceSalesMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juice Sales App'),
        backgroundColor: Colors.green[800],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.green[700],
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size(200, 100),
                ),
                child: const Text('Place Order'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JuiceOrderPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.orange[700],
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size(200, 100),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(data: [],),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('See Order'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.redAccent[700],
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size(200, 100),
                ),
                child: const Text('View Charts'),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MyWebView(
                              url: 'https://lookerstudio.google.com/s/uRu4fxiLAlY'),
                    ),
                  );
                },

              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.lightBlueAccent[700],
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size(200, 100),
                ),
                child: const Text('Order Loading'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoaderPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Colors.blueGrey[700],
                  textStyle: const TextStyle(fontSize: 20),
                  minimumSize: const Size(200, 100),
                ),
                child: const Text('Stocks'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JuiceStockPage(),
                    ),
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




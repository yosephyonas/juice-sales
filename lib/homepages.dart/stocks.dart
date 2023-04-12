import 'package:flutter/material.dart';

class JuiceStockPage extends StatefulWidget {
  const JuiceStockPage({Key? key}) : super(key: key);

  @override
  _JuiceStockPageState createState() => _JuiceStockPageState();
}

class _JuiceStockPageState extends State<JuiceStockPage> {
  Map<String, int> _juiceStock = {
    'Apple': 50,
    'Orange': 30,
    'Grape': 40,
    'Pineapple': 20,
    'Mango': 35,
    'Cranberry': 25,
    'Tomato': 15,
  };

  void _updateStock(String juiceType, int amount) {
    setState(() {
      _juiceStock[juiceType] = amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Juice Stock'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Juice stock:',
              style: TextStyle(fontSize: 20),
            ),
            Column(
              children: _juiceStock.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${entry.key}: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '${entry.value}',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => _updateStock(entry.key, 10),
                        child: Text('Add 10'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => _updateStock(entry.key, -10),
                        child: Text('Remove 10'),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

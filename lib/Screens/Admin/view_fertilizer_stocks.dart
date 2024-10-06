import 'package:flutter/material.dart';

class ViewFertilizerStocksPage extends StatelessWidget {
  const ViewFertilizerStocksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Customize the color if needed
        title: Text('Fertilizer Stocks'),
      ),
      body: Center(
        child: Text(
          'Fertilizer Stocks Page - Coming Soon!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

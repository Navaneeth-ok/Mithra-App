import 'package:flutter/material.dart';
import 'package:mithra/SQLite/sqlite.dart';
import 'package:mithra/constants.dart';
import 'package:mithra/JsonModels/seed.dart';

class ViewSeedStocksPage extends StatefulWidget {
  const ViewSeedStocksPage({Key? key}) : super(key: key);

  @override
  _ViewSeedStocksPageState createState() => _ViewSeedStocksPageState();
}

class _ViewSeedStocksPageState extends State<ViewSeedStocksPage> {
  late Future<List<Seed>> seeds;

  @override
  void initState() {
    super.initState();
    seeds = DatabaseHelper().getAllSeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Seed Stocks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: FutureBuilder<List<Seed>>(
            future: seeds,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No seeds available'));
              } else {
                final seedList = snapshot.data!;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 24.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    headingRowColor: MaterialStateProperty.all(kPrimaryColor),
                    dataRowColor: MaterialStateProperty.all(Colors.white),
                    dividerThickness: 1.5,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Seed Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Quantity',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                    rows: seedList.map((seed) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(seed.seedName)),
                          DataCell(Text(seed.quantity.toString())),
                        ],
                      );
                    }).toList(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

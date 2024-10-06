import 'package:flutter/material.dart';
import 'package:mithra/JsonModels/seed.dart';
import 'package:mithra/SQLite/sqlite.dart';
import 'package:mithra/Screens/Seeds/Request_seeds.dart';
import 'package:mithra/components/rounded_button.dart';
import 'package:mithra/constants.dart';

class SeedScreen extends StatelessWidget {
  const SeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seeds Info'),
        backgroundColor: kPrimaryColor,
      ),
      body: const SeedScreenBody(),
    );
  }
}

class SeedScreenBody extends StatefulWidget {
  const SeedScreenBody({Key? key}) : super(key: key);

  @override
  _SeedScreenBodyState createState() => _SeedScreenBodyState();
}

class _SeedScreenBodyState extends State<SeedScreenBody> {
  late Future<List<Seed>> _seeds;

  @override
  void initState() {
    super.initState();
    _seeds = _fetchSeeds();
  }

  Future<List<Seed>> _fetchSeeds() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    return await dbHelper.getAllSeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: FutureBuilder<List<Seed>>(
              future: _seeds,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No seeds available.'));
                } else {
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        headingRowColor:
                            MaterialStateProperty.all(kPrimaryColor),
                        dataRowColor: MaterialStateProperty.all(Colors.white),
                        dividerThickness: 1.5,
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Seed Type',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Quantity',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                        rows: snapshot.data!.map((seed) {
                          return DataRow(
                            cells: <DataCell>[
                              DataCell(Text(seed.seedName)),
                              DataCell(Text(seed.quantity.toString())),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: RoundedButton(
              text: "Give Seed Request",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RequestSeeds();
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

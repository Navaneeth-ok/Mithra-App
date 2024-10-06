import 'package:flutter/material.dart';
import 'package:mithra/Screens/Fertiliser/Request_fertilizer.dart';
import 'package:mithra/components/rounded_button.dart';
import 'package:mithra/constants.dart';

class FertiliserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fertilizer Info'),
        backgroundColor: kPrimaryColor,
      ),
      body: FertilizerScreenBody(),
    );
  }
}

class FertilizerScreenBody extends StatefulWidget {
  const FertilizerScreenBody({Key? key}) : super(key: key);

  @override
  _FertilizerScreenBodyState createState() => _FertilizerScreenBodyState();
}

class _FertilizerScreenBodyState extends State<FertilizerScreenBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Gradient background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: 20,
              right: 20,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Fertilizer Type',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Quantity',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                  rows: const <DataRow>[],
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              child: RoundedButton(
                text: "Give Request",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RequestFertilizer();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

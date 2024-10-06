import 'package:flutter/material.dart';
import 'package:mithra/components/rounded_button.dart';
import 'package:mithra/constants.dart';

class RequestFertilizer extends StatelessWidget {
  const RequestFertilizer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request for Fertilizer'),
        backgroundColor: kPrimaryColor,
      ),
      body: RequestFertilizerBody(),
    );
  }
}

class RequestFertilizerBody extends StatefulWidget {
  const RequestFertilizerBody({Key? key}) : super(key: key);

  @override
  _RequestFertilizerBodyState createState() => _RequestFertilizerBodyState();
}

class _RequestFertilizerBodyState extends State<RequestFertilizerBody> {
  String _selectedSeed = '--Select Fertilizer--';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              const Positioned(
                top: 150,
                left: 30,
                child: Text(
                  "Fertilizer Type",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24.0,
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 50,
                width: 250,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color:const Color.fromARGB(255, 158, 114, 235).withOpacity(.2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedSeed,
                      items: <String>['--Select Fertilizer--', 'Tomato', 'Carrot', 'Lettuce', 'Pepper']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedSeed = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 275,
                left: 30,
                child: Text(
                  "Fertilizer Quantity",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24.0,
                  ),
                ),
              ),
              Positioned(
                top: 300,
                left: 20,
                right: 40,
                child: Container(
                  margin: const EdgeInsets.all(30),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 158, 114, 235).withOpacity(.2),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Fertilizer Quantity",
                    ),
                  ),
                ),
              ),
              Positioned(
              bottom: 150,
              child: RoundedButton(
                text: "Submit",
                press: () {},
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}

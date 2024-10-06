import 'package:flutter/material.dart';
import 'package:mithra/Screens/Admin/add_fertilizer.dart';
import 'package:mithra/Screens/Admin/add_seeds.dart';
import 'package:mithra/Screens/Admin/add_subsidy.dart';
import 'package:mithra/components/socal_icon.dart';
import 'package:mithra/constants.dart';

class AddStock extends StatelessWidget {
  const AddStock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Stock'),
        backgroundColor: kPrimaryColor,
      ),
      body: AddStockBody(),
    );
  }
}

class AddStockBody extends StatefulWidget {
  const AddStockBody({Key? key}) : super(key: key);

  @override
  _AddStockBodyState createState() => _AddStockBodyState();
}

class _AddStockBodyState extends State<AddStockBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:Container(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height:30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/images/add_seeds.png",
                      text: "Add Seeds",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AddSeedsPage();
                            },
                          ),
                        );
                      },
                      key: const Key("SocalIcon_addseeds_key"),
                    ),
                  ],
                ),
                const SizedBox(height:50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/images/add_fertilizer.png",
                      text: "Add Fertilizer",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AddFertilizer();
                            },
                          ),
                        );
                      },
                      key: const Key("SocalIcon_addfertilizer_key"),
                    ),
                  ],
                ),
                const SizedBox(height:50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/images/add_subsidy.png",
                      text: "Add Subsidy",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AddSubsidy();
                            },
                          ),
                        );
                      },
                      key: const Key("SocalIcon_addsubsidy_key"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mithra/Screens/Admin/view_seed_stocks.dart'; // Import the view_seed_stocks page
import 'package:mithra/Screens/Admin/view_fertilizer_stocks.dart';
import 'package:mithra/components/socal_icon.dart';
import 'package:mithra/constants.dart';

class ViewStocksPage extends StatelessWidget {
  const ViewStocksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Stocks'),
        backgroundColor: kPrimaryColor,
      ),
      body: ViewStocksBody(),
    );
  }
}

class ViewStocksBody extends StatefulWidget {
  const ViewStocksBody({Key? key}) : super(key: key);

  @override
  _ViewStocksBodyState createState() => _ViewStocksBodyState();
}

class _ViewStocksBodyState extends State<ViewStocksBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/images/add_seeds.png",
                    text: "View Seed Stocks",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ViewSeedStocksPage();
                          },
                        ),
                      );
                    },
                    key: const Key("SocalIcon_viewseeds_key"),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/images/add_fertilizer.png",
                    text: "View Fertilizer Stocks",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ViewFertilizerStocksPage();
                          },
                        ),
                      );
                    },
                    key: const Key("SocalIcon_viewfertilizer_key"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

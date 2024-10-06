import 'package:flutter/material.dart';
import 'package:mithra/Screens/Admin/view_fertilizer_request.dart';
import 'package:mithra/Screens/Admin/view_seed_request.dart';
import 'package:mithra/components/socal_icon.dart';
import 'package:mithra/constants.dart';

class ViewRequest extends StatelessWidget {
  const ViewRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('View Request'),
        backgroundColor: kPrimaryColor,
      ),
      body: ViewRequestBody(),
    );
  }
}

class ViewRequestBody extends StatefulWidget {
  const ViewRequestBody({Key? key}) : super(key: key);

  @override
  _ViewRequestBodyState createState() => _ViewRequestBodyState();
}

class _ViewRequestBodyState extends State<ViewRequestBody> {
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
            Positioned(
              top: 80,
              child:Image.asset(
                "assets/images/viewrequest.png",
                height: 250, // Adjust the height as needed
                width: 250, // Adjust the width as needed
              ),
            ),
            Positioned(
              bottom: 150,  // Adjust the bottom position as needed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 400),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocalIcon(
                        iconSrc: "assets/images/view_seed.png",
                        text: "Seed Request",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ViewSeedRequest();
                              },
                            ),
                          );
                        },
                        key: const Key("SocalIcon_adduser_key"),
                      ),
                      SizedBox(width: 80),
                      SocalIcon(
                        iconSrc: "assets/images/view_fertilizer.png",
                        text: "Fertilizer Request",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ViewfertilizerRequest();
                              },
                            ),
                          );
                        },
                        key: const Key("SocalIcon_addstock_key"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
      
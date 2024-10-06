import 'package:flutter/material.dart';
import 'package:mithra/constants.dart';

class ViewfertilizerRequest extends StatelessWidget {
  const ViewfertilizerRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fertilizer Request'),
        backgroundColor: kPrimaryColor,
      ),
      body: ViewfertilizerRequestBody(),
    );
  }
}

class ViewfertilizerRequestBody extends StatefulWidget {
  const ViewfertilizerRequestBody({Key? key}) : super(key: key);

  @override
  _ViewfertilizerRequestBodyState createState() => _ViewfertilizerRequestBodyState();
}

class _ViewfertilizerRequestBodyState extends State<ViewfertilizerRequestBody> {
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
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
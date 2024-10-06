import 'package:flutter/material.dart';
import 'package:mithra/constants.dart';

class AddSubsidy extends StatelessWidget {
  const AddSubsidy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Subsidy'),
        backgroundColor: kPrimaryColor,
      ),
      body: AddSubsidyBody(),
    );
  }
}

class AddSubsidyBody extends StatefulWidget {
  const AddSubsidyBody({Key? key}) : super(key: key);

  @override
  _AddSubsidyBodyState createState() => _AddSubsidyBodyState();
}

class _AddSubsidyBodyState extends State<AddSubsidyBody> {
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
          ],
        ),
      ),
    );
  }
}
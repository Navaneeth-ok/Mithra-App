import 'package:flutter/material.dart';
import 'package:mithra/constants.dart';

class ViewSeedRequest extends StatelessWidget {
  const ViewSeedRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seed Request'),
        backgroundColor: kPrimaryColor,
      ),
      body: ViewSeedRequestBody(),
    );
  }
}

class ViewSeedRequestBody extends StatefulWidget {
  const ViewSeedRequestBody({Key? key}) : super(key: key);

  @override
  _ViewSeedRequestBodyState createState() => _ViewSeedRequestBodyState();
}

class _ViewSeedRequestBodyState extends State<ViewSeedRequestBody> {
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
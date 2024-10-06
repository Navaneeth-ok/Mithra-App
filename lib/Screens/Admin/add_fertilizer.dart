import 'package:flutter/material.dart';
import 'package:mithra/components/rounded_button.dart';
import 'package:mithra/constants.dart';

class AddFertilizer extends StatelessWidget {
  const AddFertilizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD FERTILIZER'),
        backgroundColor: kPrimaryColor,
      ),
      body: AddFertilizerBody(),
    );
  }
}

class AddFertilizerBody extends StatefulWidget {
  const AddFertilizerBody({Key? key}) : super(key: key);

  @override
  _AddFertilizerBodyState createState() => _AddFertilizerBodyState();
}

class _AddFertilizerBodyState extends State<AddFertilizerBody> {
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
            const Positioned(
              top: 80,
              left: 30,
              child: Text(
                "Fertilizer Name",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20.0,
                ),
              ),
            ),
            Positioned(
              top: 105,
              left: 20,
              right: 40,
              child: Container(
                margin: const EdgeInsets.all(30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:
                      const Color.fromARGB(255, 158, 114, 235).withOpacity(.2),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Fertilizer Name",
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 220,
              left: 30,
              child: Text(
                "Fertilizer Description",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20.0,
                ),
              ),
            ),
            Positioned(
              top: 240,
              left: 20,
              right: 30,
              child: Container(
                margin: const EdgeInsets.all(30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:
                      const Color.fromARGB(255, 158, 114, 235).withOpacity(.2),
                ),
                child: TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Fertilizer Description",
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 410,
              left: 30,
              child: Text(
                "Quantity",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20.0,
                ),
              ),
            ),
            Positioned(
              top: 435,
              left: 20,
              right: 40,
              child: Container(
                margin: const EdgeInsets.all(30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:
                      const Color.fromARGB(255, 158, 114, 235).withOpacity(.2),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Quantity",
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 45,
              left: 70,
              right: 70,
              child: RoundedButton(
                text: "Submit",
                press: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

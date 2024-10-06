import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mithra/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    this.login = true,
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "അക്കൗണ്ട് ഇല്ലേ?" : "അക്കൗണ്ട് ഉണ്ടോ?",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: () {
            press();
          },
          child: Text(
            login ? "രജിസ്റ്റർ ചെയ്യൂ" : "ലോഗിൻ ചെയ്യൂ",
            style: TextStyle(
              color: kPrimaryColor, 
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
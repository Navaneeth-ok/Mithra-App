import 'package:flutter/material.dart';
import 'package:mithra/Screens/Login/login_screen.dart';
import 'package:mithra/Screens/Signup/signup_screen.dart';
import 'package:mithra/components/rounded_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: size.height * 0.1,
            left: size.width * 0.35,
            child: const Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 33,
                color: Color.fromARGB(255, 190, 105, 233),
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Center(
                  child: Image.asset(
                    "assets/images/logo_mithra.png",
                    width: double.infinity,
                    height: 300,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundedButton(
                        text: "ലോഗിൻ",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ),
                          );
                        },
                      ),
                      RoundedButton(
                        text: "രജിസ്റ്റർ",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignUpScreen();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

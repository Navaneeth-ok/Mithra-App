import 'package:flutter/material.dart';
import 'package:mithra/Screens/Welcome/welcome_screen.dart';
import 'package:mithra/Screens/Profile/change_password.dart';
import 'package:mithra/components/rounded_button.dart';
import 'package:mithra/constants.dart';



class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: kPrimaryColor,
      ),
      body:Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  //Color.fromARGB(255, 231, 206, 243),
                  //Color.fromARGB(255, 228, 190, 245),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            height: size.height * 0.25,
            top: size.height * 0.1,
            child: Image.asset("assets/images/profile_page.png"),
          ),
          Positioned(
            bottom: 200,
            left:45,
            right:45,
            child:RoundedButton(
              text: "Change password",
              press: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChangePassword();
                    },
                  ),
                );
              }, 
              key: const Key("Roundedbutton_key"),
            ),
          ),
          Positioned(
            bottom: 100,
            left:45,
            right:45,
            child:RoundedButton(
              text: "Log Out",
              press: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
              key: const Key("Roundedbutton_key"),
            ),
          ),
        ],
      ),
      ),
    );

  }
}
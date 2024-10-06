import 'package:flutter/material.dart';
import 'package:mithra/Screens/Fertiliser/fertiliser_screen.dart';
import 'package:mithra/Screens/Profile/profile_screen.dart';
import 'package:mithra/Screens/Seeds/seed_screen.dart';
import 'package:mithra/Screens/Subsidy/subsidy_screen.dart';
import 'package:mithra/Screens/Weather/weather_screen.dart';
import 'package:mithra/constants.dart';
import 'package:mithra/components/socal_icon.dart';

class CompleteScreen extends StatelessWidget {
  const CompleteScreen({super.key});
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
                colors: [
                  Color.fromARGB(255, 231, 206, 243),
                  Color.fromARGB(255, 228, 190, 245),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Circle decoration
          Positioned(
            top: -50,
            child: Container(
              width: size.width,
              height: size.width,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
          // Logo
          Positioned(
            top: size.height * 0.15,
            child: const Text(
              "MITHRA",
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: 36.0,
              ),
            ),
          ),
          // Welcome text with a subtle shadow
          Positioned(
            top: size.height * 0.25,
            child: Text(
              "Welcome Farmers!",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 28.0,
                shadows: [
                  Shadow(
                    color: const Color.fromARGB(255, 8, 6, 6).withOpacity(0.5),
                    offset: const Offset(2, 2),
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
          ),
          // Body content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 300),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/images/Profile123.png",
                    text: "പ്രൊഫൈൽ",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfileScreen();
                          },
                        ),
                      );
                    },
                    key: const Key("SocalIcon_profile_key"),
                  ),
                  const SizedBox(width: 40),
                  SocalIcon(
                    iconSrc: "assets/images/Seeds.png",
                    text: "വിത്ത്",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SeedScreen();
                          },
                        ),
                      );
                    },
                    key: const Key("SocalIcon_seeds_key"),
                  ),
                  const SizedBox(width: 40),
                  SocalIcon(
                    iconSrc: "assets/images/Fertilizer.png",
                    text: "വളം",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FertiliserScreen();
                          },
                        ),
                      );
                    },
                    key: const Key("SocalIcon_fertiliser_key"),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/images/Subsidy.png",
                    text: "സബ്സിഡി",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SubsidyScreen();
                          },
                        ),
                      );
                    },
                    key: const Key("SocalIcon_subsidy_key"),
                  ),
                  const SizedBox(width: 40),
                  SocalIcon(
                    iconSrc: "assets/images/Weather.png",
                    text: "കാലാവസ്ഥ",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return WeatherScreen();
                          },
                        ),
                      );
                    },
                    key: const Key("SocalIcon_weather_key"),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ),);
  }
}
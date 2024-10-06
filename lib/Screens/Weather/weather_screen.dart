import 'package:flutter/material.dart';
import 'package:mithra/constants.dart';


class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info'),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  final String text;
  const SocalIcon({
    required Key key,
    required this.iconSrc,
    required this.press, 
    required this.text,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Column(
        children:[
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(255, 231, 206, 243),
              ),
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset(
              iconSrc,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8), 
          Text(
            text,
            style: const TextStyle(color:Colors.black,fontSize: 12),
          ),
        ],
      ), 
    );
  }
}

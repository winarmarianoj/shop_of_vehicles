import 'package:flutter/material.dart';

class CustomScreenTrucks extends StatelessWidget {  
  final String path;

  const CustomScreenTrucks({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(              
      children: <Widget>[
        Image.asset(
          path,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
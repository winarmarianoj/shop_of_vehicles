import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/constant/constantsColors.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color? color;
  const MyText({Key? key, required this.text,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: const TextStyle(
        color: kTextColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MyProfileText extends StatelessWidget {
  final String text;
  final Color? color;
  const MyProfileText({Key? key, required this.text,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: const TextStyle(
        color: kTextColor,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class MyTitleOrangeText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  const MyTitleOrangeText({Key? key, 
  required this.text,
  this.color, this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  Theme.of(context).textTheme.headline5
              ?.copyWith(color: color, fontWeight: fontWeight),
    );    
  }
}

class MyDescriptionOrangeText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  const MyDescriptionOrangeText({Key? key, 
  required this.text,
  this.color, this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium
              ?.copyWith(color: color, fontWeight: fontWeight),
    );    
  }
}

class MyPriceYellowText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  const MyPriceYellowText({Key? key, 
  required this.text,
  this.color, this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(color: color, fontWeight: fontWeight),
    );    
  }
}

class MyTextItemCardHome extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  const MyTextItemCardHome({Key? key, 
  required this.text,
  this.color, this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge
              ?.copyWith(color: color, fontWeight: fontWeight),
    );    
  }
}
import 'package:flutter/material.dart';
import 'package:shop_of_vehicles/theme/menuTheme.dart';

class ThemeChangerCopy with ChangeNotifier {

  bool _darkOne = false;
  bool _lightOne = false;
  bool _darkTwo = false;
  bool _lightTwo = false;
  bool _darkThree = false;
  bool _lightThree = false;

  ThemeData? _currentTheme;

  bool get darkOne   => this._darkOne;
  bool get lightOne => this._lightOne;
  bool get darkTwo   => this._darkTwo;
  bool get lightTwo => this._lightTwo;
  bool get darkThree   => this._darkThree;
  bool get lightThree => this._lightThree;
  ThemeData get currentTheme => this._currentTheme!;


  ThemeChangerCopy( int theme ) {

    switch( theme ) {

      case 1: // Light1        
        _darkOne = false;
        _lightOne = false;
        _darkTwo = false;
        _lightTwo = false;
        _darkThree = false;
        _lightThree = false;
        _currentTheme = themeLightOne; //lightThemeOne; //  ThemeData.light();        
      break;

      case 2: // Dark1
        _darkOne   = true;
        _lightOne = false;
        _darkTwo = false;
        _lightTwo = false;
        _darkThree = false;
        _lightThree = false;
        _currentTheme = themeDarkOne;
        ThemeData.dark().copyWith(
          accentColor: Colors.pink
        ); 
      break;

      case 3: // Dark
        _darkOne   = false;
        _lightOne = true;
      break;

      /* case 3: // Light2
        _darkOne   = false;
        _lightOne = false;
        _darkTwo = false;
        _lightTwo = true;
        _darkThree = false;
        _lightThree = false;
        _currentTheme = themeLightTwo;
        ThemeData.light().copyWith(
          accentColor: Colors.blue
        ); 
      break;

      case 4: // Dark2
        _darkOne   = false;
        _lightOne = false;
        _darkTwo = true;
        _lightTwo = false;
        _darkThree = false;
        _lightThree = false;
        _currentTheme = themeDarkTwo;
        ThemeData.dark().copyWith(
          accentColor: Colors.pink
        ); 
      break;

      case 5: // Light3
        _darkOne   = false;
        _lightOne = false;
        _darkTwo = false;
        _lightTwo = false;
        _darkThree = false;
        _lightThree = true;
        _currentTheme = themeLightThree;
        ThemeData.light().copyWith(
          accentColor: Colors.blue
        ); 
      break;          */   

      default:
        _darkOne   = false;
        _lightOne = false;
        _darkTwo = false;
        _lightTwo = false;
        _darkThree = true;
        _lightThree = false;
        _currentTheme = themeDarkThree;
    }
  }  

  set darkOne( bool value ) {
    _lightOne = false;
    _darkOne = value;
    _darkTwo = false;
    _lightTwo = false;
    _darkThree = false;
    _lightThree = false;

    if ( value ) {
      _currentTheme = themeDarkOne;
      ThemeData.dark().copyWith(
          accentColor: Colors.pink
      );
    }else {
      _currentTheme = ThemeData.light();
    } 
    notifyListeners();
  }

  set lightOne( bool value ) {
    _lightOne = value;
    _darkOne = false;
    _darkTwo = false;
    _lightTwo = false;
    _darkThree = false;
    _lightThree = false;

    if ( value ) {
      _currentTheme = themeLightOne;
      ThemeData.dark().copyWith(
        accentColor: Color(0xff48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(
          bodyText1: TextStyle( color: Colors.white )
        ),
        // textTheme.body1.color
      );
    }else {
      _currentTheme = ThemeData.light();
    } 
    notifyListeners();
  }

  set darkTwo( bool value ) {
    _lightOne = false;
    _darkOne = false;
    _darkTwo = value;
    _lightTwo = false;
    _darkThree = false;
    _lightThree = false;

    if ( value ) {
      _currentTheme = themeDarkTwo;
      /* ThemeData.dark().copyWith(
          accentColor: Colors.pink
      ); */
    }else {
      _currentTheme = ThemeData.light();
    } 
    notifyListeners();
  }

  set lightTwo( bool value ) {
    _lightOne = false;
    _darkOne = false;
    _darkTwo = false;
    _lightTwo = value;
    _darkThree = false;
    _lightThree = false;

    if ( value ) {
      _currentTheme = themeLightTwo;
      /* ThemeData.dark().copyWith(
        accentColor: Color(0xff48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(
          bodyText1: TextStyle( color: Colors.white )
        ),
        // textTheme.body1.color
      ); */
    }else {
      _currentTheme = ThemeData.light();
    } 
    notifyListeners();
  }

  set darkThree( bool value ) {
    _lightOne = false;
    _darkOne = false;
    _darkTwo = false;
    _lightTwo = false;
    _darkThree = value;
    _lightThree = false;

    if ( value ) {
      _currentTheme = themeDarkThree;
      ThemeData.dark().copyWith(
          accentColor: Colors.pink
      );
    }else {
      _currentTheme = ThemeData.light();
    } 
    notifyListeners();
  }

  set lightThree( bool value ) {
    _lightOne = false;
    _darkOne = false;
    _darkTwo = false;
    _lightTwo = false;
    _darkThree = false;
    _lightThree = value;

    if ( value ) {
      _currentTheme = themeLightThree;
      ThemeData.dark().copyWith(
        accentColor: Color(0xff48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(
          bodyText1: TextStyle( color: Colors.white )
        ),
        // textTheme.body1.color
      );
    }else {
      _currentTheme = ThemeData.light();
    } 
    notifyListeners();
  }

}
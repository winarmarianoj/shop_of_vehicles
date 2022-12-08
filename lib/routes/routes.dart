import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_of_vehicles/screens/car/homeCar.dart';
import 'package:shop_of_vehicles/screens/profile/profileUser.dart';
import 'package:shop_of_vehicles/screens/truck/homeTruck.dart';
import 'package:shop_of_vehicles/screens/van/homeVan.dart';

final pageRoutes = <_Route>[

  _Route( FontAwesomeIcons.truck , 'Trucks',  HomeTruck() ),
  _Route( FontAwesomeIcons.car , 'Cars',  HomeCar() ),
  _Route( FontAwesomeIcons.truckPickup , 'Vans',  HomeVan() ),
  _Route( FontAwesomeIcons.user , 'Profile', ProfileUser() ),

];

class _Route {

  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);

}
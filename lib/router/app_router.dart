import 'package:flutter/material.dart';
import 'package:flutter_practica_bloc/screens/screens.dart';

class AppRoutes {
  
  static const homeScreenRoute = 'home';
  static const detailScreenRoute = 'detail';
  
  static Map<String, Widget Function(BuildContext)> routes = {
    homeScreenRoute: (BuildContext context) => const HomeScreen(),
    detailScreenRoute: (BuildContext context) => const DetailScreen()
  };
  
}

import 'package:clean_architecture/core/constants/navigation/navigation_constants.dart';
import 'package:clean_architecture/main.dart';
import 'package:flutter/material.dart';

import '../../components/card/notfound_navigation_widget.dart';

class NavigationRoute {
   static NavigationRoute? _instance = NavigationRoute._init();
  static NavigationRoute? get instance => _instance;

  NavigationRoute._init();

  Route<dynamic>? generateRoute(RouteSettings routeSettings){
    switch (routeSettings.name) {
      case NavigationConstants.MyApp:
      return normalNavigate(const MyApp());
        
      default:
      return MaterialPageRoute(builder:(context) => const NotFoundNavigation() ,);
    }
   
  }
  MaterialPageRoute normalNavigate(Widget widget){
    return MaterialPageRoute(builder: ((context) => widget ));
  }
}
import 'package:flutter/cupertino.dart';

import 'Inavigation_service.dart';

class NavigationService implements INavigationService {
  static NavigationService? _instance = NavigationService._init();
  static NavigationService? get instance => _instance;

  NavigationService._init();
  GlobalKey<NavigatorState> navigatorKey=GlobalKey();
  final removeAllOldRoutes=(Route<dynamic> route)=>false;
 
  
  @override
  Future<void> navigaToPage({String? path, Object? data}) async {
 await navigatorKey.currentState!.pushNamed(path!,arguments:data);
  }
  
  @override
  Future<void> navigaToPageClear({String? path, Object? data}) async {
    
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path!,removeAllOldRoutes,arguments:data);
  }
}

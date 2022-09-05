import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
 
  static final HiveManager _instance = HiveManager._init();
  HiveManager? _boxs;
  static HiveManager get instance=>_instance;
   
  HiveManager._init();

  Box? box;
  static Future boxInit( TypeAdapter<dynamic> adapter) async{
    Hive.registerAdapter(adapter);
    instance.box??=await Hive.openBox('myBox');
  }
  
 void addBox(String key,dynamic value){
  box?.put(key, value);
 }
 dynamic getBox(String key){
  box?.get(key);
 }
}


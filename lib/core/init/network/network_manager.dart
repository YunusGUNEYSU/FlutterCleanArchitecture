import 'dart:io';

import 'package:clean_architecture/core/base/model/base_error.dart';
import 'package:clean_architecture/core/base/model/base_model.dart';
import 'package:clean_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:clean_architecture/core/init/cache/locale_manager.dart';
import 'package:dio/dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance{
    _instance ??= NetworkManager._init();
    return _instance;
      
  }
  NetworkManager._init(){
    final baseOptions=BaseOptions(baseUrl: 'BASE-URL',
    headers: {'val':LocaleManager.instance.getStringValue(PreferencesKeys.token)
    });
  
  
    _dio=Dio(baseOptions);
    _dio.interceptors.add(InterceptorsWrapper(
      onError:(e, handler) =>BaseError(e.message),
      // onResponse: (e, handler) {
      //   e.data;
      // },

      )
    );

  }
 late final Dio _dio;

 Future dioGet<T extends BaseModel> (String path,T model) async {
  final response= await _dio.get('path');
  switch (response.statusCode) {
    case HttpStatus.ok:
      final responseBody=response.data;
      if(responseBody is List){
        return responseBody.map((e) =>model.fromJson(e)).toList();
      }
      else if(responseBody is Map<String,Object>){
        return model.fromJson(responseBody);
      }
      return responseBody;
    default:
  }
 }
}
// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:shared_preferences/shared_preferences.dart';

import '../../enums/cache_keys.dart';
import 'cache_service.dart';

class SharedPrefsCacheService implements ICacheService {
  SharedPreferences? _prefs;

  SharedPrefsCacheService() {
    initCache();
  }

  @override
  Future<void> initCache() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> setCache<T>(CacheKey key, T value) async {
    if (value is String)            await _prefs?.setString(key.name, value);
    else if (value is int)          await _prefs?.setInt(key.name, value);
    else if (value is double)       await _prefs?.setDouble(key.name, value);
    else if (value is bool)         await _prefs?.setBool(key.name, value);
    else if (value is List<String>) await _prefs?.setStringList(key.name, value);
    else throw Exception("'${value.runtimeType}' Unsupported type.");
  }

  @override
  T? getCache<T>(CacheKey key) {
    if (T == String)            return _prefs?.getString(key.name) as T?;
    else if (T == int)          return _prefs?.getInt(key.name) as T?;
    else if (T == double)       return _prefs?.getDouble(key.name) as T?;     
    else if (T == bool)         return _prefs?.getBool(key.name) as T?;   
    else if (T == List<String>) return _prefs?.getStringList(key.name) as T?; 
    else throw Exception("'$T' Unsupported type.");
  }

  @override
  Future<void> deleteCache(CacheKey key) async {
    await _prefs?.remove(key.name);
  }
}
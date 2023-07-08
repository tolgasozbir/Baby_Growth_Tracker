import 'package:baby_growth_tracker/services/app_services.dart';
import 'package:baby_growth_tracker/services/cache_service/cache_service.dart';
import 'package:flutter/material.dart';

import '../enums/cache_keys.dart';
import '../models/baby.dart';

class BabiesProvider extends ChangeNotifier {
  
  final ICacheService _cacheService = AppServices.instance.cacheService;
  final List<Baby> _babyList = [];
  List<Baby> get babyList => _babyList;

  /// Initializes and prepares cached values.
  void initCacheValues() async {
    List<String>? cachedValues = _cacheService.getCache<List<String>>(CacheKey.BabyList) ?? [];
    List<Baby> cachedList = cachedValues.map((e) => Baby.fromJson(e)).toList();
    _babyList.addAll(cachedList);
  }
  
  Future<void> saveToCache() async {
    List<String> babyListStr = _babyList.map((e) => e.toJson()).toList();
    await _cacheService.setCache<List<String>>(CacheKey.BabyList, babyListStr);
    notifyListeners();
  }

  Future<void> addBaby(Baby baby) async {
    _babyList.add(baby);
    await saveToCache();
    notifyListeners();
  }

}
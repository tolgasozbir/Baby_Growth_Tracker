import 'package:baby_growth_tracker/services/cache_service/cache_service.dart';
import 'package:baby_growth_tracker/services/cache_service/shared_prefs_cache_service.dart';

class AppServices {
  AppServices._();

  static final AppServices _instance = AppServices._();
  static AppServices get instance => _instance;

  final ICacheService _cacheService = SharedPrefsCacheService();
  ICacheService get cacheService => _cacheService;

  Future<void> initServices() async {
    await cacheService.initCache();
  }

}
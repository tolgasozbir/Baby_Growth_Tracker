import '../../enums/cache_keys.dart';

abstract class ICacheService {
  Future<void> initCache();
  Future<void> setCache<T>(CacheKey key, T value);
  T? getCache<T>(CacheKey key);
  Future<void> deleteCache(CacheKey key);
}
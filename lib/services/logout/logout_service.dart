import '../../core/data/cache/client/base_cache.dart';

class LogoutService {
  final BaseCache cache;

  // final Logger logger = serviceLocator<Logger>();

  LogoutService({
    required this.cache,
  });

  Future<void> doLogout() async {
    await cache.flushAll();
  }
}

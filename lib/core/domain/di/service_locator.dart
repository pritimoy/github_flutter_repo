import 'package:get_it/get_it.dart';

import '../../../app/app.dart';
import '../../../services/logout/logout_service.dart';
import '../../data/cache/client/base_cache.dart';
import '../../data/cache/client/preference_cache.dart';
import '../../data/http/http_export.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator(AppConfig appConfig) async {
  ///high level dependencies
  serviceLocator.registerSingleton<AppConfig>(appConfig);
  // request

  serviceLocator.registerFactory<BaseCache>(() => PreferenceCache());

  serviceLocator.registerFactory<ApiClientConfig>(() => ApiClientConfig(
        baseUrl: appConfig.apiBaseUrl,
        isDebug: appConfig.debug,
        apiVersion: appConfig.apiVersion,
      ));

  // serviceLocator.registerSingleton<Logger>(Logger());

  serviceLocator.registerSingleton<LogoutService>(
    LogoutService(
      cache: serviceLocator<BaseCache>(),
    ),
  );

  ///splash

  // serviceLocator.registerFactory<GetUser>(() => GetUser(serviceLocator()));
  // serviceLocator.registerFactory<ProfileRepository>(
  //         () => ProfileRepositoryImpl(serviceLocator()));
  // serviceLocator.registerFactory<ProfileDatasource>(
  //         () => ProfileCacheDatasource(serviceLocator()));

  serviceLocator.registerFactory<ApiProviderTokenInterceptor>(
      () => ApiProviderTokenInterceptor());
  serviceLocator.registerFactory<DioClient>(() => DioClient());

  ///todo: set client set after init service locator
  serviceLocator<DioClient>().setClient();
  serviceLocator
      .registerFactory<ApiClient>(() => ApiClient(dioClient.getClient()));
}

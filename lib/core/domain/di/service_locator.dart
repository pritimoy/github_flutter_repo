import 'package:get_it/get_it.dart';
import 'package:github_flutter_repo/features/home/data/datasource/home_cache_datasource.dart';
import 'package:github_flutter_repo/features/home/data/datasource/home_http_datasource.dart';
import 'package:github_flutter_repo/features/home/data/repository/home_repository_impl.dart';
import 'package:github_flutter_repo/features/home/domain/usecase/get_github_repos.dart';

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

  serviceLocator.registerSingleton<LogoutService>(
    LogoutService(
      cache: serviceLocator<BaseCache>(),
    ),
  );

  ///cache datasource
  serviceLocator.registerFactory<HomeCacheDatasource>(
      () => HomeCacheDatasource(serviceLocator()));

  /// Http datasource
  serviceLocator.registerFactory<HomeHttpDatasource>(
      () => HomeHttpDatasource(serviceLocator()));

  ///repository
  serviceLocator.registerFactory(
      () => HomeRepositoryImpl(serviceLocator(), serviceLocator()));

  // serviceLocator.registerFactory<HomeRepository>(() => HomeRepository);

  ///usecase
  serviceLocator
      .registerFactory<GetGitHubRepos>(() => GetGitHubRepos(serviceLocator()));

  serviceLocator.registerFactory<ApiProviderTokenInterceptor>(
      () => ApiProviderTokenInterceptor());
  serviceLocator.registerFactory<DioClient>(() => DioClient());

  ///todo: set client set after init service locator
  serviceLocator<DioClient>().setClient();
  serviceLocator
      .registerFactory<ApiClient>(() => ApiClient(dioClient.getClient()));
}

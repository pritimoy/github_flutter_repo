import '../../../../app/app.dart';

part 'authentication_api_urls.dart';

class ApiUrl implements AuthenticationApiUrls {
  var baseUrl = "${appConfig.getApiClientConfig().baseUrl}api/";
  var apiVersion = appConfig.getApiClientConfig().apiVersion;

  @override
  String get emailLoginUrl => "${baseUrl}Account/Login";

  @override
  String get facebookLoginUrl => throw UnimplementedError();

  @override
  String get gmailLoginUrl => throw UnimplementedError();

  @override
  String get registrationUrl => throw UnimplementedError();

  @override
  String get getAllTrade => "${baseUrl}Item/getall";

  @override
  String get getDashboardData => throw UnimplementedError();

  @override
  String get repoSearchUrl => "/search/repositories";
}

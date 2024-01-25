import 'package:dartz/dartz.dart';
import 'package:github_flutter_repo/core/core_export.dart';
import 'package:github_flutter_repo/core/utils/typedef.dart';
import 'package:github_flutter_repo/features/home/data/datasource/home_datasource.dart';
import 'package:github_flutter_repo/features/home/data/models/get_github_repos_params.dart';
import 'package:github_flutter_repo/features/home/data/models/github_repo_response.dart';

class HomeHttpDatasource extends HttpDatasource implements HomeDatasource {
  HomeHttpDatasource(ApiClient client) : super(client);

  @override
  ResultFuture<GitHubRepoResponse> getGitHubRepo(
      GetGitHubReposParams params) async {
    var response = await client.invokeApi(ApiUrl().repoSearchUrl, HTTPType.get,
        queryParams: {"q": "flutter", "per_page": 10, "page": 1});
    return response.fold((error) => Left(error),
        (data) => Right(GitHubRepoResponse.fromJson(data)));
  }
}

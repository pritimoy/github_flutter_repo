import 'package:github_flutter_repo/core/core_export.dart';
import 'package:github_flutter_repo/core/utils/typedef.dart';
import 'package:github_flutter_repo/features/home/data/datasource/home_datasource.dart';
import 'package:github_flutter_repo/features/home/data/models/get_github_repos_params.dart';
import 'package:github_flutter_repo/features/home/data/models/github_repo_response.dart';

class HomeCacheDatasource extends CacheDatasource implements HomeDatasource {
  HomeCacheDatasource(super.cache);

  @override
  ResultFuture<GitHubRepoResponse> getGitHubRepo(GetGitHubReposParams params) {
    // TODO: implement getGitHubRepo
    throw UnimplementedError();
  }
}

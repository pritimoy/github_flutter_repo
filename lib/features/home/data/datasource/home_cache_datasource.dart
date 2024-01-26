import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:github_flutter_repo/core/core_export.dart';
import 'package:github_flutter_repo/core/utils/typedef.dart';
import 'package:github_flutter_repo/features/home/data/datasource/home_datasource.dart';
import 'package:github_flutter_repo/features/home/data/models/get_github_repos_params.dart';
import 'package:github_flutter_repo/features/home/data/models/github_repo_response.dart';

class HomeCacheDatasource extends CacheDatasource implements HomeDatasource {
  HomeCacheDatasource(super.cache);

  @override
  ResultFuture<GitHubRepoResponse> getGitHubRepo(
      GetGitHubReposParams params) async {
    if (await cache.has(SharedPreferenceConstant.repoData)) {
      var jsonRepoData = await cache.get(SharedPreferenceConstant.repoData);
      GitHubRepoResponse gitHubRepoResponse =
          GitHubRepoResponse.fromJson(jsonDecode(jsonRepoData!));
      return Right(gitHubRepoResponse);
    } else {
      return const Left(APIFailure(message: "exception", statusCode: 800));
    }
  }

  Future<void> storeRepoData(GitHubRepoResponse gitHubRepoResponse) async {
    await cache.forever(SharedPreferenceConstant.repoData,
        jsonEncode(gitHubRepoResponse.toJson()));
  }
}

import 'package:dartz/dartz.dart';
import 'package:github_flutter_repo/core/utils/typedef.dart';
import 'package:github_flutter_repo/features/home/data/datasource/home_cache_datasource.dart';
import 'package:github_flutter_repo/features/home/data/datasource/home_http_datasource.dart';
import 'package:github_flutter_repo/features/home/data/models/get_github_repos_params.dart';
import 'package:github_flutter_repo/features/home/data/models/github_repo_response.dart';
import 'package:github_flutter_repo/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeHttpDatasource homeHttpDatasource;
  final HomeCacheDatasource homeCacheDatasource;
  HomeRepositoryImpl(this.homeHttpDatasource, this.homeCacheDatasource);

  @override
  ResultFuture<GitHubRepoResponse> getGitHubRepo(
      GetGitHubReposParams params) async {
    var response = await homeHttpDatasource.getGitHubRepo(params);
    if (response.isLeft()) {
      return await homeCacheDatasource.getGitHubRepo(params);
    }

    return response.fold((l) => Left(l), (r) {
      homeCacheDatasource.storeRepoData(r);
      return Right(r);
    });
  }
}

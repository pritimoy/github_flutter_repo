import 'package:github_flutter_repo/core/domain/usecase/usecase.dart';
import 'package:github_flutter_repo/core/utils/typedef.dart';
import 'package:github_flutter_repo/features/home/data/models/home_model_export.dart';
import 'package:github_flutter_repo/features/home/data/repository/home_repository_impl.dart';

class GetGitHubRepos
    extends UseCaseWithParams<GitHubRepoResponse, GetGitHubReposParams> {
  const GetGitHubRepos(this._homeRepository);
  final HomeRepositoryImpl _homeRepository;

  @override
  ResultFuture<GitHubRepoResponse> call(GetGitHubReposParams params) =>
      _homeRepository.getGitHubRepo(params);
}

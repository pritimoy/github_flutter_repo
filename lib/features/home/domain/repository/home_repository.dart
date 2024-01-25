import 'package:github_flutter_repo/core/utils/typedef.dart';

import '../../data/models/home_model_export.dart';

abstract class HomeRepository {
  ResultFuture<GitHubRepoResponse> getGitHubRepo(GetGitHubReposParams params);
}

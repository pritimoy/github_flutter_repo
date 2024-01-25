import '../../../../core/utils/typedef.dart';
import '../models/home_model_export.dart';

abstract class HomeDatasource {
  ResultFuture<GitHubRepoResponse> getGitHubRepo(GetGitHubReposParams params);
}

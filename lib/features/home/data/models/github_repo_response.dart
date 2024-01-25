import 'home_model_export.dart';

class GitHubRepoResponse {
  int? totalCount;
  List<GitRepoItem>? gitRepoItem;

  GitHubRepoResponse({this.totalCount, this.gitRepoItem});

  GitHubRepoResponse.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    if (json['items'] != null) {
      gitRepoItem = <GitRepoItem>[];
      json['items'].forEach((v) {
        gitRepoItem!.add(GitRepoItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_count'] = totalCount;
    if (gitRepoItem != null) {
      data['items'] = gitRepoItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

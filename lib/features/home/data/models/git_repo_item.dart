import 'home_model_export.dart';

class GitRepoItem {
  int? id;
  String? name;
  Owner? owner;
  String? htmlUrl;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? stargazersCount;
  int? watchersCount;
  String? language;
  String? visibility;

  GitRepoItem(
      {this.id,
      this.name,
      this.owner,
      this.htmlUrl,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.stargazersCount,
      this.watchersCount,
      this.language,
      this.visibility});

  GitRepoItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    language = json['language'];
    visibility = json['visibility'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['html_url'] = htmlUrl;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['stargazers_count'] = stargazersCount;
    data['watchers_count'] = watchersCount;
    data['language'] = language;
    data['visibility'] = visibility;
    return data;
  }
}

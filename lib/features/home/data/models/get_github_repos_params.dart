import 'package:equatable/equatable.dart';

class GetGitHubReposParams extends Equatable {
  final String keyword;
  final int page;
  final int perPage;
  final String sort;

  const GetGitHubReposParams(
      {required this.keyword,
      required this.page,
      required this.perPage,
      required this.sort});

  @override
  List<Object?> get props => [keyword, page, perPage, sort];
}

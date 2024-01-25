import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_flutter_repo/core/utils/state_status.dart';

import '../../data/models/home_model_export.dart';
import '../../domain/usecase/get_github_repos.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGitHubRepos getGitHubRepos;
  HomeBloc(this.getGitHubRepos) : super(const HomeState()) {
    on<RequestGithubRepository>(_onGetGitRepository);
  }

  void _onGetGitRepository(
      RequestGithubRepository event, Emitter<HomeState> emit) async {
    var response = await getGitHubRepos.call(const GetGitHubReposParams(
        keyword: "", page: 1, perPage: 2, sort: "star"));

    response.fold(
        (l) => debugPrint("--------error ${l.message}"),
        (r) => debugPrint(
            "---------------> res ${r.totalCount} ${r.gitRepoItem?[0].name}"));
  }
}

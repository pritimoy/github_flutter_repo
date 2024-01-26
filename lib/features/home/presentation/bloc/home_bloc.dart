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

  List<GitRepoItem>? gitRepoItemList = <GitRepoItem>[];
  int page = 1;
  HomeBloc(this.getGitHubRepos) : super(HomeState()) {
    on<RequestGithubRepository>(_onGetGitRepository);
  }

  void _onGetGitRepository(
      RequestGithubRepository event, Emitter<HomeState> emit) async {
    emit(state.copyWith(stateStatus: StateStatus.loading));
    var response = await getGitHubRepos.call(const GetGitHubReposParams(
        keyword: "", page: 1, perPage: 2, sort: "star"));

    response.fold(
        (l) => debugPrint("--------error ${l.message}"),
        (data) => {
              debugPrint(
                  "---------------> res ${data.totalCount} ${data.gitRepoItem?[0].name}"),
              gitRepoItemList?.addAll(data.gitRepoItem!),
              emit(state.copyWith(
                  stateStatus: StateStatus.loaded,
                  gitRepoItemList: gitRepoItemList)),
            });
  }
}

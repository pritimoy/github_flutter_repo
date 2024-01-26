import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_flutter_repo/core/utils/state_status.dart';
import 'package:github_flutter_repo/res/res_export.dart';
import 'package:github_flutter_repo/services/navigation/navigation_service.dart';

import '../../data/models/home_model_export.dart';
import '../../domain/usecase/get_github_repos.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGitHubRepos getGitHubRepos;

  List<GitRepoItem> gitRepoItemList = <GitRepoItem>[];
  int page = 1;
  HomeBloc(this.getGitHubRepos) : super(HomeState()) {
    on<RequestGithubRepository>(_onGetGitRepository);
    on<RequestSortRepository>(_onGetSortRepository);
    on<RequestOnSelect>(_onSelectTap);
  }

  void _onGetSortRepository(
      RequestSortRepository event, Emitter<HomeState> emit) async {
    gitRepoItemList.clear();
    page = 1;
    emit(state.copyWith(stateStatus: StateStatus.initial));
    add(RequestGithubRepository(sort: event.sort, isSort: true));
  }

  void _onSelectTap(RequestOnSelect event, Emitter<HomeState> emit) async {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
    NavigationService.navigateTo(RoutePaths.detailsRepo);
  }

  void _onGetGitRepository(
      RequestGithubRepository event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isPaginationLoading: true));

    var response = await getGitHubRepos.call(GetGitHubReposParams(
        keyword: "flutter", page: page, perPage: 10, sort: event.sort ?? ""));

    response.fold(
      (l) => emit(state.copyWith(
          stateStatus: StateStatus.error, isPaginationLoading: false)),
      (data) => {
        if (data.totalCount != null)
          {
            gitRepoItemList.addAll(data.gitRepoItem!),
            // print("list count -------->>>${gitRepoItemList.length}"),
            if (gitRepoItemList.length < 1000 &&
                data.totalCount! > gitRepoItemList.length)
              {
                page = page + 1,
                emit(state.copyWith(
                    stateStatus: StateStatus.loaded,
                    gitRepoItemList: gitRepoItemList,
                    hasNext: true,
                    isPaginationLoading: false)),
              },
          },
      },
    );
  }
}

part of 'home_bloc.dart';

class HomeState extends Equatable {
  final StateStatus stateStatus;
  List<GitRepoItem> gitRepoItemList;

  HomeState(
      {this.stateStatus = StateStatus.initial,
      this.gitRepoItemList = const <GitRepoItem>[]});

  HomeState copyWith(
      {StateStatus? stateStatus, List<GitRepoItem>? gitRepoItemList}) {
    return HomeState(
        stateStatus: stateStatus ?? this.stateStatus,
        gitRepoItemList: gitRepoItemList ?? this.gitRepoItemList);
  }

  @override
  List<Object?> get props => [stateStatus, gitRepoItemList];
}

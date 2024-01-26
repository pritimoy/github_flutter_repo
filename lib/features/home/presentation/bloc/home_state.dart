part of 'home_bloc.dart';

class HomeState extends Equatable {
  final StateStatus stateStatus;
  List<GitRepoItem> gitRepoItemList;
  bool isPaginationLoading;
  bool hasNext;
  int? selectedIndex;

  HomeState(
      {this.stateStatus = StateStatus.initial,
      this.gitRepoItemList = const <GitRepoItem>[],
      this.hasNext = false,
      this.isPaginationLoading = false,
      this.selectedIndex});

  HomeState copyWith(
      {StateStatus? stateStatus,
      List<GitRepoItem>? gitRepoItemList,
      bool? hasNext,
      bool? isPaginationLoading,
      int? selectedIndex}) {
    return HomeState(
        stateStatus: stateStatus ?? this.stateStatus,
        gitRepoItemList: gitRepoItemList ?? this.gitRepoItemList,
        hasNext: hasNext ?? this.hasNext,
        isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
        selectedIndex: selectedIndex ?? selectedIndex);
  }

  @override
  List<Object?> get props => [
        stateStatus,
        gitRepoItemList,
        hasNext,
        isPaginationLoading,
        selectedIndex
      ];
}

part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class RequestGithubRepository extends HomeEvent {
  final String? sort;
  final bool? isSort;
  const RequestGithubRepository({this.sort, this.isSort});

  @override
  List<Object?> get props => [sort];
}

class RequestSortRepository extends HomeEvent {
  final String? sort;

  const RequestSortRepository({this.sort});

  @override
  List<Object?> get props => [sort];
}

class RequestOnSelect extends HomeEvent {
  final int selectedIndex;
  const RequestOnSelect(this.selectedIndex);
  @override
  List<Object?> get props => [selectedIndex];
}

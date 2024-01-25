part of 'home_bloc.dart';

class HomeState extends Equatable {
  final StateStatus stateStatus;

  const HomeState({this.stateStatus = StateStatus.initial});

  @override
  List<Object?> get props => [];
}

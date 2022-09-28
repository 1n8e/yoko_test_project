part of 'active_bloc.dart';

@immutable
abstract class ActiveState {}

class ActiveInitial extends ActiveState {}

class LoadingActiveState extends ActiveState {}

class SuccessLoadedState extends ActiveState {
  final List<Active> actives;

  SuccessLoadedState(this.actives);
}

class FailureLoadedState extends ActiveState {
  final String error;

  FailureLoadedState(this.error);
}

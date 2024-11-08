part of 'counter_bloc.dart';


@immutable
sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object?> get props => [];
}


class InitialCounterState extends CounterState {

  const InitialCounterState();

  @override
  List<Object?> get props => [];
}


class LoadingCounterState extends CounterState {}

class SuccessCounterState extends CounterState {

  const SuccessCounterState();

  @override
  List<Object?> get props => [];
}

class FailureCounterState extends CounterState {
  final String error;

  const FailureCounterState(this.error);

  @override
  List<Object?> get props => [error];
}
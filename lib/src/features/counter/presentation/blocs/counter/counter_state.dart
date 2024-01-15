part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterIdle extends CounterState {
  final int counter;

  CounterIdle({required this.counter});
}

class CounterLoading extends CounterState {}

class CounterSuccess extends CounterState {}

class CounterError extends CounterState {
  final String errorMessage;

  CounterError({required this.errorMessage});
}

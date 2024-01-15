part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterAdd extends CounterEvent {}

class CounterSubtract extends CounterEvent {}

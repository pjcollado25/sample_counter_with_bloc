import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int newCounter = 0;
  CounterBloc() : super(CounterIdle(counter: 0)) {
    on<CounterAdd>(_onCounterAdd);
    on<CounterSubtract>(_onCounterSubstract);
  }

  void _onCounterAdd(CounterAdd event, Emitter<CounterState> emit) async {
    newCounter = newCounter + 1;

    emit(CounterLoading());
    await Future.delayed(const Duration(microseconds: 500));
    emit(CounterIdle(counter: newCounter));
  }

  void _onCounterSubstract(
      CounterSubtract event, Emitter<CounterState> emit) async {
    newCounter = newCounter - 1;

    emit(CounterLoading());
    await Future.delayed(const Duration(microseconds: 500));
    emit(CounterIdle(counter: newCounter));
  }
}

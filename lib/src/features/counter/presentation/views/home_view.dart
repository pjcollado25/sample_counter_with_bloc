import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_counter_with_bloc/src/features/counter/presentation/blocs/counter/counter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterIdle) {
              return Text(
                state.counter.toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              );
            } else if (state is CounterLoading) {
              const CircularProgressIndicator();
            } else {
              return const SizedBox();
            }
            return const SizedBox();
          },
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(CounterAdd()),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(CounterSubtract()),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

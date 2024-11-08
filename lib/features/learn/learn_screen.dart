import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/features/learn/bloc/counter_bloc.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Counter with States'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is LoadingCounterState) {
            return const Center(child: CircularProgressIndicator());
          } else  {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter Value: ${context.read<CounterBloc>().counter}', style: const TextStyle(fontSize: 24)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.read<CounterBloc>().add(IncrementCounter()),
                        child: const Text('+'),
                      ),
                     const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => context.read<CounterBloc>().add(DecrementCounter()),
                        child: const Text('-'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } 

        },
      ),
    );
  }
}

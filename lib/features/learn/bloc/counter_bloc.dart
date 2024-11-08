import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(const InitialCounterState()) {
    on<IncrementCounter>((event, emit) async {
      emit(LoadingCounterState());
      await Future.delayed(const Duration(seconds: 1));
      counter += 1;

      emit(const SuccessCounterState());
    });

    on<DecrementCounter>((event, emit) async {
      emit(LoadingCounterState());
      await Future.delayed(const Duration(seconds: 1));
      counter -= 1;
      emit(const SuccessCounterState());
    }, transformer: droppable());
  }
}

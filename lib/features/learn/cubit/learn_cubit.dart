
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/features/learn/cubit/learn_state.dart';

class LearnCubit extends Cubit<LearnState> {

  LearnCubit() : super(LearnInitial(counter: 0));

  void increment() async{
    
    emit(LearnLoading(counter: state.counter));
    await Future.delayed(const Duration(seconds: 2));
    emit(LearnSuccess(counter: state.counter+1));
  }

  
  void decrement() async{

        emit(LearnLoading(counter: state.counter));
    await Future.delayed(const Duration(seconds: 2));
    emit(LearnSuccess(counter: state.counter-1));
  }

}
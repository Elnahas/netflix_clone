abstract class LearnState {
  late int counter;

  LearnState({required this.counter});
  
} 

class LearnInitial extends LearnState {
  LearnInitial( {required super.counter});
}

class LearnLoading extends LearnState {
  LearnLoading({required super.counter});
 
}

class LearnSuccess extends LearnState {
  LearnSuccess({required super.counter});
 
}

class LearnFailure extends LearnState {
 String err ;
  LearnFailure({required this.err, required super.counter});
}
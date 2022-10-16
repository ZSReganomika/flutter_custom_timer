part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}

class TimerInitialState  extends TimerState {
  const TimerInitialState(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

class TimerRunPauseState  extends TimerState {
  const TimerRunPauseState (super.duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

class TimerRunInProgressState  extends TimerState {
  const TimerRunInProgressState (super.duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

class TimerRunCompleteState  extends TimerState {
  const TimerRunCompleteState () : super(0);
}

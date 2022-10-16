import 'package:equatable/equatable.dart';

class CustomTimer extends Equatable {
  const CustomTimer({required this.duration, required this.interval});

  final int duration;
  final int interval;

  @override
  List<Object?> get props => [duration, interval];
}

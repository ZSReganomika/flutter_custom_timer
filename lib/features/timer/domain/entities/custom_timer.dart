import 'package:equatable/equatable.dart';

class Duration extends Equatable {
  const Duration(this.duration);

  final int duration;

  @override
  List<Object?> get props => [duration];
}

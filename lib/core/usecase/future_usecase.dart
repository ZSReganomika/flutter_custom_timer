// ignore: one_member_abstracts
import 'package:equatable/equatable.dart';

abstract class FutureUseCase<Input, Output> {
  Future<Output> execute(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
// ignore: one_member_abstracts
abstract class FutureUseCase<Input, Output> {
  Future<Output> execute(Input params);
}

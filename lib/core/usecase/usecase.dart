import 'package:fpdart/fpdart.dart';
import 'package:tennis_court/core/error/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}

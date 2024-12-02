import 'package:fpdart/fpdart.dart';
import 'package:tennis_court/core/error/failure.dart';
import 'package:tennis_court/core/usecase/usecase.dart';
import 'package:tennis_court/features/home/domain/entities/court.dart';
import 'package:tennis_court/features/home/domain/repositories/court_repository.dart';

class GetCourtsUsecase implements UseCase<List<Court>, NoParams> {
  final CourtRepository courtRepository;
  GetCourtsUsecase(this.courtRepository);

  @override
  Future<Either<Failure, List<Court>>> call(NoParams params) async =>
      await courtRepository.getCourts();
}

import 'package:fpdart/fpdart.dart';
import 'package:tennis_court/core/error/failure.dart';
import 'package:tennis_court/core/usecase/usecase.dart';
import 'package:tennis_court/features/home/domain/repositories/court_repository.dart';

class RemoveFavoriteUsecase implements UseCase<void, String> {
  final CourtRepository courtRepository;
  RemoveFavoriteUsecase(this.courtRepository);

  @override
  Future<Either<Failure, void>> call(String id) async =>
      await courtRepository.removeFavorite(id);
}

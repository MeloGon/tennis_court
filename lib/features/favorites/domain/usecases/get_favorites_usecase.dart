import 'package:fpdart/fpdart.dart';
import 'package:tennis_court/core/error/failure.dart';
import 'package:tennis_court/core/usecase/usecase.dart';
import 'package:tennis_court/features/home/domain/repositories/court_repository.dart';

class GetFavoritesUsecase implements UseCase<List<String>, NoParams> {
  final CourtRepository courtRepository;
  GetFavoritesUsecase(this.courtRepository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async =>
      await courtRepository.getFavorites();
}

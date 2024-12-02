import 'package:fpdart/src/either.dart';
import 'package:tennis_court/core/error/exceptions.dart';
import 'package:tennis_court/core/error/failure.dart';
import 'package:tennis_court/features/home/data/datasources/local_court_datasource.dart';
import 'package:tennis_court/features/home/domain/entities/court.dart';
import 'package:tennis_court/features/home/domain/repositories/court_repository.dart';

class CourtRepositoryImpl implements CourtRepository {
  final LocalCourtDataSource localCourtDataSource;
  CourtRepositoryImpl(this.localCourtDataSource);

  @override
  Future<Either<Failure, List<Court>>> getCourts() async {
    try {
      final courts = await localCourtDataSource.getCourts();
      return right(courts);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

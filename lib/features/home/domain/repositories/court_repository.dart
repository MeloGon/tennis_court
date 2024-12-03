import 'package:fpdart/fpdart.dart';
import 'package:tennis_court/core/error/failure.dart';
import 'package:tennis_court/features/home/domain/entities/court.dart';

abstract interface class CourtRepository {
  Future<Either<Failure, List<Court>>> getCourts();
  Future<Either<Failure, void>> addFavorite(String id);
  Future<Either<Failure, void>> removeFavorite(String id);
  Future<Either<Failure, List<String>>> getFavorites();
}

import 'package:fpdart/src/either.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis_court/core/error/exceptions.dart';
import 'package:tennis_court/core/error/failure.dart';
import 'package:tennis_court/features/home/data/datasources/local_court_datasource.dart';
import 'package:tennis_court/features/home/domain/entities/court.dart';
import 'package:tennis_court/features/home/domain/repositories/court_repository.dart';

class CourtRepositoryImpl implements CourtRepository {
  final LocalCourtDataSource localCourtDataSource;
  static const _favoritesKey = 'favorites';
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

  @override
  Future<Either<Failure, void>> addFavorite(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = prefs.getStringList(_favoritesKey) ?? [];

      if (!favorites.contains(id)) {
        favorites.add(id);
        final result = await prefs.setStringList(_favoritesKey, favorites);

        if (result) {
          return const Right(null);
        } else {
          return Left(
              Failure('Failed to save favorites to SharedPreferences.'));
        }
      } else {
        return const Right(null);
      }
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorite(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = prefs.getStringList(_favoritesKey) ?? [];

      if (favorites.contains(id)) {
        favorites.remove(id);
        final result = await prefs.setStringList(_favoritesKey, favorites);

        if (result) {
          return const Right(null);
        } else {
          return Left(
              Failure('Failed to remove favorite from SharedPreferences.'));
        }
      } else {
        return const Right(null);
      }
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = prefs.getStringList(_favoritesKey) ?? [];
      return Right(favorites);
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}

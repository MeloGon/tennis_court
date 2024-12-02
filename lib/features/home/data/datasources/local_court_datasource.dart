import '../models/court_model.dart';

abstract interface class LocalCourtDataSource {
  Future<List<CourtModel>> getCourts();
}

class LocalCourtDataSourceImpl implements LocalCourtDataSource {
  @override
  Future<List<CourtModel>> getCourts() async {
    // Simulación de datos locales
    final data = [
      {
        'id': '1',
        'name': 'Cancha Azul',
        'type': 'Tipo A',
        'imageUrl': 'https://via.placeholder.com/400',
        'availability': '7:00 am a 4:00 pm',
      },
      {
        'id': '2',
        'name': 'Cancha Verde',
        'type': 'Tipo B',
        'imageUrl': 'https://via.placeholder.com/400',
        'availability': '8:00 am a 5:00 pm',
      },
    ];
    return data.map((json) => CourtModel.fromJson(json)).toList();
  }
}

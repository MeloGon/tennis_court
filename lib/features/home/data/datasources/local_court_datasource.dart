import 'package:tennis_court/core/config.dart';

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
        'imageUrl': AppImages.court1,
        'availability': '7:00 am a 4:00 pm',
        'price': '25'
      },
      {
        'id': '2',
        'name': 'Rusty Tenis',
        'type': 'Tipo C',
        'imageUrl': AppImages.court2,
        'availability': '9:00 am a 10:00 pm',
        'price': '35'
      },
      {
        'id': '3',
        'name': 'Cancha multiple',
        'type': 'Tipo B',
        'imageUrl': AppImages.court3,
        'availability': '8:00 am a 5:00 pm',
        'price': '45'
      },
    ];
    return data.map((json) => CourtModel.fromJson(json)).toList();
  }
}

import 'package:hive_ce_flutter/hive_flutter.dart';

class Court {
  final String? id;
  final String? name;
  final String? type;
  final String? imageUrl;
  final String? availability;
  final String? price;
  final bool? isFavorite;

  Court({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.availability,
    required this.price,
    this.isFavorite = false,
  });

  Court copyWith({
    bool? isFavorite,
  }) {
    return Court(
      id: id,
      name: name,
      imageUrl: imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      type: type,
      availability: availability,
      price: price,
    );
  }
}

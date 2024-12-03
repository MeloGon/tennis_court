import 'package:tennis_court/features/home/domain/entities/court.dart';

class CourtModel extends Court {
  CourtModel(
      {super.id,
      super.name,
      super.type,
      super.imageUrl,
      super.availability,
      super.price,
      super.isFavorite});

  factory CourtModel.fromJson(Map<String, dynamic> json) {
    return CourtModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      imageUrl: json['imageUrl'],
      availability: json['availability'],
      price: json['price'],
      isFavorite: json['isFavorite'],
    );
  }

  CourtModel copyWith({
    bool? isFavorite,
  }) {
    return CourtModel(
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

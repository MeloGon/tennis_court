import 'package:tennis_court/features/home/domain/entities/court.dart';

class CourtModel extends Court {
  CourtModel({
    super.id,
    super.name,
    super.type,
    super.imageUrl,
    super.availability,
  });

  factory CourtModel.fromJson(Map<String, dynamic> json) {
    return CourtModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      imageUrl: json['imageUrl'],
      availability: json['availability'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'imageUrl': imageUrl,
      'availability': availability,
    };
  }
}
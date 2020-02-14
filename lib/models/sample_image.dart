import 'package:flutter_unsplash/models/user.dart';

class SampleImage {
  final String id;
  final String description;
  final String thumbImage;
  final String regularImage;
  final User user;

  SampleImage(
      {this.id,
      this.description,
      this.thumbImage,
      this.regularImage,
      this.user});

  static fromJson(json) => SampleImage(
    id: json['id'],
    description: json['description'],
    regularImage: json['urls']['regular'],
    thumbImage: json['urls']['thumb'],
    user: User.fromJson(json['user']),
  );
}

import 'package:movie_app/app/src/tves/domain/entities/tvGenres.dart';

class TVGenresModel extends TvGenres {
  const TVGenresModel({required super.id, required super.name});

  factory TVGenresModel.fromJson(Map<String, dynamic> json) {
    return TVGenresModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

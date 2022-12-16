import '../../domain/entities/recomndtion.dart';

class RecommditionModel extends Recommndition {
  const RecommditionModel({
    required super.id,
    super.backdropPath,
  });
  factory RecommditionModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return RecommditionModel(
      id: json['id'],
      backdropPath: json['backdrop_path'] ?? "",
    );
  }
}

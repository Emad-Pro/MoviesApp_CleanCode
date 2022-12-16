import 'package:equatable/equatable.dart';

class Recommndition extends Equatable {
  final int id;
  final String? backdropPath;

  const Recommndition({required this.id, this.backdropPath});

  @override
  // TODO: implement props
  List<Object?> get props => [id, backdropPath];
}

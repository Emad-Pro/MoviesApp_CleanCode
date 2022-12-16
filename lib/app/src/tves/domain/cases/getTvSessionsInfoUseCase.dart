import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/app/src/tves/data/models/tvDetailsSessionModel.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvDetailsSessionInfo.dart';
import 'package:movie_app/app/src/tves/domain/repositroy/base_tv_repositroy.dart';

import '../../../core/erorr/Failure.dart';
import '../entities/tvDetails.dart';

class GetTVSessionDetailsUseCase extends Equatable {
  final BaseTvRepository baseTvRepository;

  const GetTVSessionDetailsUseCase(this.baseTvRepository);
  Future<Either<Faliure, List<TVDetailsSessionInfo>>> getTvSessionDetails(
      {required int tvId, required int sessionNum}) async {
    return await baseTvRepository.getTvDetailsSession(tvId: tvId, sessionNum: sessionNum);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

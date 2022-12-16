import 'package:dartz/dartz.dart';

import '../../../core/erorr/Failure.dart';
import '../entities/tvDetails.dart';
import '../repositroy/base_tv_repositroy.dart';

class GetTvDetailsUseCase {
  final BaseTvRepository baseTvRepository;

  GetTvDetailsUseCase(this.baseTvRepository);
  Future<Either<Faliure, TvDetails>> getTvDetails({required int tvId}) async {
    return await baseTvRepository.getDetailsTv(id: tvId);
  }
}

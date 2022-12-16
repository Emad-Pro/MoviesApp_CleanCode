import 'package:get_it/get_it.dart';
import 'package:movie_app/app/src/search/data/dataSource/searchRemoteDataSource.dart';
import 'package:movie_app/app/src/search/data/repositroy/search_repository.dart';
import 'package:movie_app/app/src/search/domain/cases/getSearchDataUseCase.dart';
import 'package:movie_app/app/src/search/domain/repositroy/base_Search_repositroy.dart';
import 'package:movie_app/app/src/search/presentation/controller/bloc/search_bloc.dart';
import 'package:movie_app/app/src/tves/data/dataSource/tvRemoteDataSource.dart';
import 'package:movie_app/app/src/tves/data/repositroy/tvRepositry.dart';
import 'package:movie_app/app/src/tves/domain/cases/GetTvOnTheAirUseCase.dart';
import 'package:movie_app/app/src/tves/domain/cases/getRecommnditionUseCase.dart';
import 'package:movie_app/app/src/tves/domain/cases/getTvDetailsUseCase.dart';
import 'package:movie_app/app/src/tves/domain/cases/getTvPopularUseCase.dart';
import 'package:movie_app/app/src/tves/domain/cases/getTvSessionsInfoUseCase.dart';
import 'package:movie_app/app/src/tves/domain/cases/getTvTopRatedUseCase.dart';
import 'package:movie_app/app/src/tves/domain/repositroy/base_tv_repositroy.dart';
import 'package:movie_app/app/src/tves/presentation/controllers/bloc/tv_bloc.dart';

import '../../moves/data/dataSource/movie_remote_data_Source.dart';
import '../../moves/data/repositroy/moviesRepositry.dart';
import '../../moves/domain/cases/getMovieDetailsUseCase.dart';
import '../../moves/domain/cases/getNowPlayingMoviesUseCase.dart';
import '../../moves/domain/cases/getPopularMoviesUseCase.dart';
import '../../moves/domain/cases/getRecommnditionMoviesUseCase.dart';
import '../../moves/domain/cases/getTopRatedMoviesUseCases.dart';
import '../../moves/domain/cases/getUpCommingMoviesUseCases.dart';
import '../../moves/domain/repositroy/base_movies_repositroy.dart';
import '../../moves/presentation/controllers/bloc/movie_details_bloc.dart';
import '../../moves/presentation/controllers/moveis_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerLazySingleton(() => SearchBloc(getIt()));
    getIt.registerLazySingleton(() => GetSearchDataUseCase(getIt()));
    getIt.registerLazySingleton<BaseSearchRepository>(() => SearchRepository(getIt()));
    getIt.registerLazySingleton<BaseSearchRemoteDataSource>(() => SearchRemoteDataSource());
    /////////////////////////////////////////////////////////////////////////////////////
    getIt.registerLazySingleton(() => MoviesBloc(getIt(), getIt(), getIt(), getIt()));
    getIt.registerLazySingleton(() => MovieDetailsBloc(getIt(), getIt()));
    getIt.registerLazySingleton(() => GetUpComingMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetRecommnditionMovieUseCase(getIt()));
    getIt.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(getIt()));
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

    ////////////////////////////// Tv/ ////////////////////////////////////////////////////
    getIt.registerLazySingleton(() => TvBloc(getIt(), getIt(), getIt(), getIt(), getIt(), getIt()));
    getIt.registerLazySingleton(() => GetTvOnTheAirUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTvPopularUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTvTopRatedUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTvDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetRecommnditionUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTVSessionDetailsUseCase(getIt()));
    getIt.registerLazySingleton<BaseTvRepository>(() => TvRepositry(getIt()));
    getIt.registerLazySingleton<BaseTvRemoteDataSource>(() => TvRemoteDataSource());
  }
}

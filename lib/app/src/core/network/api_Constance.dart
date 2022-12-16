class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = 'c056a8c4563698d6b071a359adac7566';
  static const String languageContent = 'en-US';
  static const String nowPlayingMoviesPath =
      '${baseUrl}movie/now_playing?api_key=$apiKey&language=en-US&page=1';
  static String getPouplerMoviesPath({required int pageNum}) =>
      '${baseUrl}movie/popular?api_key=$apiKey&language=en-US&page=$pageNum';
  static String topRatedMoviesPath({required int pageNum}) =>
      '${baseUrl}movie/top_rated?api_key=$apiKey&language=en-US&page=$pageNum';
  static String upComingPath({required int pageNum}) =>
      '${baseUrl}movie/upcoming?api_key=$apiKey&language=en-US&page=$pageNum';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String movieDetailsPath(int? movieId) => '${baseUrl}movie/$movieId?api_key=$apiKey';
  static String recommditionMoviePath(int? movieId) =>
      '${baseUrl}movie/$movieId/recommendations?api_key=$apiKey';
  static String imgeUrl(String pathUrl) => '$baseImageUrl$pathUrl';

  //////////////////////TV///////////////////////////////////////////////////
  static String onTheAirTvPath(int pageNum) =>
      '${baseUrl}tv/on_the_air?api_key=$apiKey&language=$languageContent&page=${pageNum}';
  static String popularTvPath(int pageNum) =>
      '${baseUrl}tv/popular?api_key=$apiKey&language=$languageContent&page=${pageNum}';
  static String topRatedTvPath({required int pageNum}) =>
      '${baseUrl}tv/top_rated?api_key=$apiKey&language=$languageContent&page=${pageNum}';
  static String tvDetailsPath({required int? tvId}) => '${baseUrl}tv/$tvId?api_key=$apiKey';
  static String tvSessionDetailsPath({required int? tvId, required int? sessionNum}) =>
      '${baseUrl}tv/$tvId/season/$sessionNum?api_key=$apiKey';
  static String tvRecommnditionPath({required int? tvId}) =>
      '${baseUrl}tv/$tvId/recommendations?api_key=$apiKey';

/////////////////////////////////////////////////Search////////////////////////
  ///
  static String searchTvAndMoviePath({String? query, int? pageNum}) =>
      '${baseUrl}search/multi?api_key=$apiKey&language=$languageContent&query=$query&page=$pageNum';
}

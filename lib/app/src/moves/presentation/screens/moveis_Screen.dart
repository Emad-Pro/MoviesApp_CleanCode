import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/src/core/utils/enum.dart';
import 'package:movie_app/app/src/moves/presentation/controllers/movies_state.dart';

import '../../../core/services/service_locator.dart';
import '../controllers/moveis_bloc.dart';
import '../controllers/movies_event.dart';
import '../widgets/nowPlayingWidget.dart';
import '../widgets/popular_widget.dart';
import '../widgets/topRated_widget.dart';
import '../widgets/upComming_widget.dart';
import 'movie_seeMore_popular_screen.dart';
import 'movie_seeMore_topRated_screen.dart';
import 'movie_seeMore_upComing_screen.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true,
        create: ((context) => MoviesBloc(getIt(), getIt(), getIt(), getIt())
          ..add(const GetTopRatedMoviesEvent(pageNum: 1))
          ..add(GetNowPlayingMoviesEvent())
          ..add(const GetPopularMoviesEvent(pageNum: 1))
          ..add(const GetUpCommingMoviesEvent(pageNum: 1))),
        child: BlocConsumer<MoviesBloc, MoviesState>(
            builder: (context, state) {
              return state.getPopularState != RequestState.loaded ||
                      state.getTopRatedState != RequestState.loaded ||
                      state.nowPlayingState != RequestState.loaded ||
                      state.getUpComingState != RequestState.loaded
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      key: const Key('movieScrollView'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          nowPlayingWidget(context, nowPlayingMoviesState: state),
                          Container(
                            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Popular",
                                  style: GoogleFonts.poppins(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.15,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const MoviesPoupluarSeeMore()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: const [
                                        Text(
                                          'See More',
                                          style: TextStyle(),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          popularMoviesWidget(context, getPopularMoviesState: state),
                          Container(
                            margin: const EdgeInsets.fromLTRB(
                              16.0,
                              24.0,
                              16.0,
                              8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Top Rated",
                                  style: GoogleFonts.poppins(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.15,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const MoviestopRatedSeeMore()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: const [
                                        Text(
                                          'See More',
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          topRatedMoviesWidget(context, getTopRatedMoviesState: state),
                          Container(
                            margin: const EdgeInsets.fromLTRB(
                              16.0,
                              24.0,
                              16.0,
                              8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Up Comming",
                                  style: GoogleFonts.poppins(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.15,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const MoviesupCommingSeeMore()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: const [
                                        Text(
                                          'See More',
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          upCommingWidgetMovies(context, getUpComingMoviesState: state),
                          const SizedBox(height: 50.0),
                        ],
                      ),
                    );
            },
            listener: (context, state) {}));
  }
}

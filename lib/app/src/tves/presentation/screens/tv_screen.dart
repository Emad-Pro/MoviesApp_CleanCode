import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/src/core/services/service_locator.dart';
import 'package:movie_app/app/src/moves/presentation/controllers/moveis_bloc.dart';
import 'package:movie_app/app/src/tves/presentation/controllers/bloc/tv_bloc.dart';
import 'package:movie_app/app/src/tves/presentation/screens/tvSeeMorePopluar_Screen.dart';
import 'package:movie_app/app/src/tves/presentation/screens/tvSeeMoreTopRated_Screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_Constance.dart';
import '../../../core/utils/enum.dart';
import '../../../moves/presentation/screens/movie_detail_screen.dart';
import '../widgets/onTheAirWidget.dart';
import '../widgets/popularTvWidget.dart';
import '../widgets/topRatedWidget.dart';

class MainTvScreen extends StatelessWidget {
  const MainTvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true,
        create: (context) => TvBloc(getIt(), getIt(), getIt(), getIt(), getIt(), getIt())
          ..add(const GetTvOnTheAirEvent(pageNum: 1))
          ..add(const GetTopRatedTvEvent(pageNum: 1))
          ..add(const GetPopularTvEvent(pageNum: 1)),
        child: BlocConsumer<TvBloc, TvState>(
            builder: (context, state) {
              return state.tvOnTheAirState != RequestState.loaded ||
                      state.tvPopularState != RequestState.loaded ||
                      state.tvTopRatedState != RequestState.loaded
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      key: const Key('movieScrollView'),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          onTheAirWidget(context, onTheAirState: state),
                          Container(
                            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
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
                                            builder: (context) => const TvSeeMoreTopRated()));
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
                          topRatedWidget(topRatedState: state),
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
                                            builder: (context) => const TvSeeMorePopluar()));
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
                          popularTvWidget(popularState: state)
                        ],
                      ),
                    );
            },
            listener: (context, state) {}));
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:number_paginator/number_paginator.dart';

import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_Constance.dart';
import '../../../core/services/service_locator.dart';
import '../controllers/moveis_bloc.dart';
import '../controllers/movies_event.dart';
import '../controllers/movies_state.dart';
import 'movie_detail_screen.dart';

class MoviestopRatedSeeMore extends StatelessWidget {
  const MoviestopRatedSeeMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<MoviesBloc>()..add(const GetTopRatedMoviesEvent(pageNum: 1)),
      child: BlocConsumer<MoviesBloc, MoviesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("TopRated Movies"),
              ),
              body: AnimatedConditionalBuilder(
                  condition: state.getTopRatedMovies != null,
                  builder: (context) => Column(
                        children: [
                          Expanded(
                            child: AnimatedConditionalBuilder(
                                condition: state.getTopRatedMovies != null,
                                builder: (context) => AnimationLimiter(
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 10,
                                          );
                                        },
                                        itemCount: state.getTopRatedMovies!.result.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          final movie = state.getTopRatedMovies!.result[index];
                                          return AnimationConfiguration.staggeredList(
                                            position: index,
                                            duration: const Duration(milliseconds: 375),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (context) {
                                                  return MovieDetailScreen(id: movie.id);
                                                }));
                                              },
                                              child: SlideAnimation(
                                                verticalOffset: 50.0,
                                                child: FadeIn(
                                                  delay: const Duration(milliseconds: 50),
                                                  child: Container(
                                                    color: Colors.grey[900],
                                                    height: 130,
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 110,
                                                          height: 120,
                                                          child: ClipRRect(
                                                            borderRadius: const BorderRadius.all(
                                                                Radius.circular(4.0)),
                                                            child: CachedNetworkImage(
                                                              imageUrl: ApiConstance.imgeUrl(
                                                                  movie.backdropPath),
                                                              placeholder: (context, url) =>
                                                                  Shimmer.fromColors(
                                                                baseColor: Colors.grey[850]!,
                                                                highlightColor: Colors.grey[800]!,
                                                                child: Container(
                                                                  height: 170.0,
                                                                  width: 120.0,
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.black,
                                                                    borderRadius:
                                                                        BorderRadius.circular(8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                              errorWidget: (context, url, error) =>
                                                                  const Icon(Icons.error),
                                                              height: 180.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.spaceAround,
                                                            children: [
                                                              SizedBox(
                                                                width: 250,
                                                                child: Text(
                                                                  movie.title,
                                                                  maxLines: 1,
                                                                  style:
                                                                      const TextStyle(fontSize: 17),
                                                                ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    padding:
                                                                        const EdgeInsets.symmetric(
                                                                      vertical: 2.0,
                                                                      horizontal: 8.0,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                      color: Colors.red[800],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    child: Text(
                                                                      movie.releaseDate
                                                                          .split('-')[0],
                                                                      style: const TextStyle(
                                                                        fontSize: 16.0,
                                                                        fontWeight: FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons.star_sharp,
                                                                        color: Colors.amber[600],
                                                                      ),
                                                                      Text(
                                                                        (movie.voteAvg)
                                                                            .toStringAsFixed(1),
                                                                        style: const TextStyle(
                                                                          fontSize: 16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          letterSpacing: 1.2,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                width: 250,
                                                                child: Text(
                                                                  movie.overview,
                                                                  maxLines: 2,
                                                                  style: const TextStyle(
                                                                    fontSize: 14.0,
                                                                    fontWeight: FontWeight.w400,
                                                                    letterSpacing: 1.2,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                fallback: (context) => const Center(
                                      child: CircularProgressIndicator(),
                                    )),
                          ),
                          NumberPaginator(
                            numberPages: state.getTopRatedMovies!.totalPage,
                            onPageChange: (int page) {
                              getIt<MoviesBloc>().add(GetTopRatedMoviesEvent(pageNum: page + 1));
                            },
                          )
                        ],
                      ),
                  fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      )));
        },
      ),
    );
  }
}

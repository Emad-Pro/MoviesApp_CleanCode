import 'package:animate_do/animate_do.dart';
import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movie_app/app/src/core/services/service_locator.dart';
import 'package:movie_app/app/src/moves/presentation/screens/movie_detail_screen.dart';
import 'package:movie_app/app/src/search/presentation/controller/bloc/search_bloc.dart';
import 'package:movie_app/app/src/tves/presentation/screens/tvDetailsScreen.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_Constance.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SearchBloc>(),
      child: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Search Movies And TVs"),
              ),
              body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: textEditingController,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            getIt<SearchBloc>().add(GetSearchDataEvent(query: value, pageNum: 1));
                          }
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder(), hintText: "Search"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      if (textEditingController.text.isNotEmpty)
                        NumberPaginator(
                          numberPages: state.querySearchData!.totalPages > 500
                              ? 500
                              : state.querySearchData!.totalPages,
                          onPageChange: (int pageNum) {
                            if (textEditingController.text.isNotEmpty) {
                              getIt<SearchBloc>().add(GetSearchDataEvent(
                                  query: textEditingController.text, pageNum: pageNum + 1));
                            }
                          },
                        ),
                      Expanded(
                        child: AnimatedConditionalBuilder(
                            condition: state.querySearchData != null &&
                                textEditingController.text.isNotEmpty,
                            builder: (context) {
                              return ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                                itemCount: state.querySearchData!.results.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final movie = state.querySearchData!.results[index];
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    child: InkWell(
                                      onTap: () {
                                        if (movie.mediaType == 'tv') {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TvDetailsScreen(id: movie.id)));
                                        } else if (movie.mediaType == 'movie') {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MovieDetailScreen(id: movie.id)));
                                        }
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
                                                      imageUrl:
                                                          ApiConstance.imgeUrl(movie.posterPath),
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
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceAround,
                                                    children: [
                                                      SizedBox(
                                                        width: 250,
                                                        child: Text(
                                                          movie.originalTitle,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                            fontSize: 17,
                                                          ),
                                                        ),
                                                      ),
                                                      if (movie.mediaType != 'person')
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Container(
                                                                padding: const EdgeInsets.symmetric(
                                                                  vertical: 2.0,
                                                                  horizontal: 8.0,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                  color: Colors.red[800],
                                                                  borderRadius:
                                                                      BorderRadius.circular(4.0),
                                                                ),
                                                                child: movie.mediaType == "tv"
                                                                    ? const Icon(Icons.tv)
                                                                    : movie.mediaType == "movie"
                                                                        ? const Icon(Icons.movie)
                                                                        : const Icon(Icons
                                                                            .info_outline_sharp),
                                                              ),
                                                            ),
                                                            if (movie.releaseDate != '')
                                                              Container(
                                                                padding: const EdgeInsets.symmetric(
                                                                  vertical: 2.0,
                                                                  horizontal: 8.0,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                  color: Colors.red[800],
                                                                  borderRadius:
                                                                      BorderRadius.circular(4.0),
                                                                ),
                                                                child: Text(
                                                                  movie.releaseDate.split('-')[0],
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
                                                                if (movie.voteAverage != '')
                                                                  Text(
                                                                    (movie.voteAverage)
                                                                        .toStringAsFixed(1),
                                                                    style: const TextStyle(
                                                                      fontSize: 16.0,
                                                                      fontWeight: FontWeight.w500,
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
                              );
                            },
                            fallback: (context) {
                              return const Center(
                                child: Text("عمليات البحث"),
                              );
                            }),
                      )
                    ],
                  )));
        },
      ),
    );
  }
}

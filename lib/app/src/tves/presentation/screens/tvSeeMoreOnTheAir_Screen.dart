import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movie_app/app/src/core/utils/enum.dart';
import 'package:movie_app/app/src/tves/presentation/controllers/bloc/tv_bloc.dart';
import 'package:movie_app/app/src/tves/presentation/screens/tvDetailsScreen.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_Constance.dart';
import '../../../core/services/service_locator.dart';

class TvSeeMoreOnTheAir extends StatelessWidget {
  const TvSeeMoreOnTheAir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<TvBloc>()..add(const GetTvOnTheAirEvent(pageNum: 1)),
      child: BlocConsumer<TvBloc, TvState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("On The Air Tvs")),
            body: Column(
              children: [
                Expanded(
                  child: AnimationLimiter(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: state.tvOnTheAir!.results.length,
                      itemBuilder: (BuildContext context, int index) {
                        final movie = state.tvOnTheAir!.results[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return TvDetailsScreen(id: movie.id);
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
                                          borderRadius:
                                              const BorderRadius.all(Radius.circular(4.0)),
                                          child: CachedNetworkImage(
                                            imageUrl: ApiConstance.imgeUrl(movie.backdropPath),
                                            placeholder: (context, url) => Shimmer.fromColors(
                                              baseColor: Colors.grey[850]!,
                                              highlightColor: Colors.grey[800]!,
                                              child: Container(
                                                height: 170.0,
                                                width: 120.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius: BorderRadius.circular(8.0),
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
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              width: 250,
                                              child: Text(
                                                movie.name,
                                                style: const TextStyle(fontSize: 17),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.symmetric(
                                                    vertical: 2.0,
                                                    horizontal: 8.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red[800],
                                                    borderRadius: BorderRadius.circular(4.0),
                                                  ),
                                                  child: Text(
                                                    movie.firstAirDate.split('-')[0],
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
                                                      (movie.voateAvg).toStringAsFixed(1),
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
                    ),
                  ),
                ),
                SizedBox(
                  child: NumberPaginator(
                    numberPages: state.tvTopRated!.totalPages,
                    onPageChange: (page) {
                      getIt<TvBloc>().add(GetTopRatedTvEvent(pageNum: page + 1));
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

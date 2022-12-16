import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app/src/core/services/service_locator.dart';
import 'package:movie_app/app/src/tves/presentation/controllers/bloc/tv_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_Constance.dart';
import '../screens/tvDetailsScreen.dart';

Widget recommnditionTvWidget({required int idTv}) {
  return BlocProvider(
    create: (context) => TvBloc(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    )..add(GetTvRecommnditionEvent(idTv)),
    child: BlocConsumer<TvBloc, TvState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.7,
            crossAxisCount: 3,
          ),
          itemCount: state.tvRecommnditionList.length,
          itemBuilder: (contex, index) {
            final recommendation = state.tvRecommnditionList[index];
            return FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TvDetailsScreen(
                                id: recommendation.id,
                              )));
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  child: CachedNetworkImage(
                    imageUrl: recommendation.backdropPath == null
                        ? "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png"
                        : ApiConstance.imgeUrl(recommendation.backdropPath),
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
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_Constance.dart';
import '../../../core/services/service_locator.dart';
import '../controllers/bloc/tv_bloc.dart';

Widget episodesTvWidget({required TvState state}) {
  ScrollController testController = ScrollController();
  return FadeInUp(
    child: ListView.builder(
        controller: testController,
        itemBuilder: (context, index) {
          return BlocProvider(
            create: (context) => TvBloc(getIt(), getIt(), getIt(), getIt(), getIt(), getIt())
              ..add(GetTVSessionDetailsEvent(idTv: state.tvDetails!.id, sessionNum: index + 1)),
            child: ExpansionTile(
              title: Text(
                "Session ${index + 1}",
              ),
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: BlocConsumer<TvBloc, TvState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return ListView.builder(
                        controller: testController,
                        itemBuilder: (context, index) {
                          final tvSession = state.tvDetailsSessionInfoList[index];
                          return SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FadeInLeft(
                                        child: ClipRRect(
                                          borderRadius:
                                              const BorderRadius.all(Radius.circular(8.0)),
                                          child: CachedNetworkImage(
                                            width: 150.0,
                                            fit: BoxFit.cover,
                                            imageUrl: ApiConstance.imgeUrl(
                                                tvSession.stillPath.toString()),
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
                                          ),
                                        ),
                                      ),
                                      FadeInUp(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 12.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 200,
                                                child: Text(
                                                  "${index + 1}.${tvSession.name}",
                                                ),
                                              ),
                                              Text(
                                                tvSession.airdate,
                                                style: Theme.of(context).textTheme.caption,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  FadeInDown(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 7,
                                      ),
                                      child: Text(
                                        tvSession.overview,
                                        style: Theme.of(context).textTheme.caption,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: state.tvDetailsSessionInfoList.length,
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
        itemCount: state.tvDetails!.numberOfSesson),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app/src/moves/presentation/screens/moveis_Screen.dart';
import 'package:movie_app/app/src/tves/presentation/screens/tv_screen.dart';
import 'package:movie_app/setting/presentation/controllers/cubit/setting_cubit.dart';
import 'package:movie_app/setting/presentation/controllers/cubit/setting_state.dart';
import 'package:movie_app/setting/utils.dart';

import 'app/src/search/presentation/screens/searchScreen.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 77, 74, 74).withOpacity(1.0),
            currentIndex: state.index,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.movie,
                ),
                label: 'Movies',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.tv,
                ),
                label: 'TVs',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search")
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavigationCubit>(context).getNavBarItem(NavbarItem.movies);
              } else if (index == 1) {
                BlocProvider.of<NavigationCubit>(context).getNavBarItem(NavbarItem.tv);
              } else if (index == 2) {
                BlocProvider.of<NavigationCubit>(context).getNavBarItem(NavbarItem.search);
              }
            },
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(builder: (context, state) {
        if (state.navbarItem == NavbarItem.movies) {
          return const MainMoviesScreen();
        } else if (state.navbarItem == NavbarItem.tv) {
          return const MainTvScreen();
        } else if (state.navbarItem == NavbarItem.search) {
          return const SearchScreen();
        }
        return Container();
      }),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/setting/presentation/controllers/cubit/setting_state.dart';

import '../../../utils.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.movies, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.movies:
        emit(const NavigationState(NavbarItem.movies, 0));
        break;
      case NavbarItem.tv:
        emit(const NavigationState(NavbarItem.tv, 1));
        break;
      case NavbarItem.search:
        emit(const NavigationState(NavbarItem.search, 2));
        break;
    }
  }
}

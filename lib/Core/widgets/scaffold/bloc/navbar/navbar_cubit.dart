import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(NavbarState(index: 0));

  changeNavbarState(
      int value, BuildContext context, PageController pageController) {
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  onPageViewChanged(int value) {
    emit(NavbarState(index: value));
  }

  initNavbar() {
    emit(NavbarState(index: 0));
  }
}

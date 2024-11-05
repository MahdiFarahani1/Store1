import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/func/func_back.dart';
import 'package:flutter_application_1/Features/splash/splash.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroState(indexIntro: 0, textBtn: 'بعدی'));

  void changeState(int value) {
    emit(state.copyWith(
      indexIntro: value,
    ));
    switch (state.indexIntro) {
      case 0:
        emit(state.copyWith(textBtn: 'بعدی'));
        break;
      case 1:
        emit(state.copyWith(textBtn: 'بعدی'));
        break;
      case 2:
        emit(state.copyWith(textBtn: 'تمام'));
        break;
      default:
    }
  }

  void changeStateWithBtn(PageController controller, BuildContext context) {
    if (state.indexIntro < 2) {
      controller.animateToPage(state.indexIntro + 1,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    } else {
      NavToPage.pushReplacement(context, const SplashScreen());
    }
  }
}

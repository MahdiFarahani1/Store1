part of 'intro_cubit.dart';

class IntroState {
  static String next = 'التالي';
  int indexIntro;
  String textBtn;
  IntroState({
    required this.indexIntro,
    required this.textBtn,
  });

  IntroState copyWith({int? indexIntro, String? textBtn}) {
    return IntroState(
        indexIntro: indexIntro ?? this.indexIntro,
        textBtn: textBtn ?? this.textBtn);
  }
}

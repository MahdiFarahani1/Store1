part of 'search_cubit.dart';

class SearchState extends GG {
  final stt.SpeechToText speech;
  bool isListening;
  String voiceInput;
  TextEditingController textController;

  SearchState(
      {required this.speech,
      required this.isListening,
      required this.textController,
      required this.voiceInput});

  SearchState copyWith(
      {stt.SpeechToText? speechNew,
      bool? isListeningNew,
      String? voiceInputNew,
      TextEditingController? textControllerNew}) {
    return SearchState(
        speech: speechNew ?? speech,
        isListening: isListeningNew ?? isListening,
        textController: textControllerNew ?? textController,
        voiceInput: voiceInputNew ?? voiceInput);
  }
}

sealed class GG {}

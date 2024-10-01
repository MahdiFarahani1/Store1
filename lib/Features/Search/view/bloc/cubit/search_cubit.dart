import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit()
      : super(SearchState(
            isListening: false,
            speech: stt.SpeechToText(),
            voiceInput: '',
            textController: TextEditingController()));

  void startListening() async {
    bool available = await state.speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );
    if (available) {
      emit(state.copyWith(isListeningNew: true));
      state.speech.listen(
          onResult: (val) {
            emit(state.copyWith(
              voiceInputNew: val.recognizedWords,
              textControllerNew:
                  TextEditingController(text: val.recognizedWords),
            ));
          },
          localeId: "fa",
          listenMode: stt.ListenMode.search);
    }
  }

  void stopListening() {
    emit(state.copyWith(isListeningNew: false));
    state.speech.stop();
  }
}

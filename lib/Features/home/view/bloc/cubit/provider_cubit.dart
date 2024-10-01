import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/Features/home/data/model/model.dart';
import 'package:flutter_application_1/Features/home/data/provider_api.dart';
import 'package:flutter_application_1/Features/home/view/bloc/cubit/status_provider.dart';

part 'provider_state.dart';

class ProviderCubit extends Cubit<ProviderState> {
  ProviderCubit() : super(ProviderState(dataState: InitData()));

  fetchData() async {
    emit(ProviderState(dataState: LoadingData()));

    try {
      var response = await ProviderApi().getApi();
      if (response.statusCode == 200) {
        List<dynamic> newsList = response.data['categories'];
        List<CategoryModel> newsModel = newsList
            .map(
              (json) => CategoryModel.fromJson(json),
            )
            .toList();

        emit(ProviderState(dataState: CompleteData(items: newsModel)));
      } else {
        emit(ProviderState(
            dataState: ErrorData(errorContent: "server have problem.....")));
      }
    } catch (e) {
      emit(ProviderState(
          dataState: ErrorData(errorContent: "no data found..... $e")));
      print(e);
    }
  }
}

import 'package:bloc/bloc.dart';

part 'itemPicker_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit()
      : super(ReportState(
            data: [
              "item 1",
              "item 2",
              "item 3",
              "item 4",
              "item 5",
              "item 6",
              "item 7",
              "item 8",
              "item 9",
              "item 10",
              "item 11",
              "item 12"
            ],
            itemPickerState:
                ItemPicker(currentCompanyPage: 0, currentPricePage: 0)));

  itemCompany(int index) {
    emit(state.copyWith(
        itemPicker: state.itemPickerState.copyWith(currentCompanyPage: index)));
  }

  itemPrice(int index) {
    emit(state.copyWith(
        itemPicker: state.itemPickerState.copyWith(currentPricePage: index)));
  }

  send({required String item, required String price}) {
    print("Price == $price _____________________ product == $item");
  }
}

part of 'itemPicker_cubit.dart';

class ReportState {
  List<String> data;
  ItemPicker itemPickerState;
  ReportState({required this.data, required this.itemPickerState});

  ReportState copyWith({
    List<String>? data,
    ItemPicker? itemPicker,
  }) {
    return ReportState(
        data: data ?? this.data,
        itemPickerState: itemPicker ?? this.itemPickerState);
  }
}

class ItemPicker {
  int currentCompanyPage;
  int currentPricePage;

  ItemPicker(
      {required this.currentCompanyPage, required this.currentPricePage});

  ItemPicker copyWith({int? currentCompanyPage, int? currentPricePage}) {
    return ItemPicker(
        currentCompanyPage: currentCompanyPage ?? this.currentCompanyPage,
        currentPricePage: currentPricePage ?? this.currentPricePage);
  }
}

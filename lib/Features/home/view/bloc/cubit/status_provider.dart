import 'package:flutter_application_1/Features/home/data/model/model.dart';

abstract class DataState {}

class InitData extends DataState {}

class LoadingData extends DataState {}

class CompleteData extends DataState {
  final List<CategoryModel> items;
  CompleteData({required this.items});
}

class ErrorData extends DataState {
  final String errorContent;
  ErrorData({required this.errorContent});
}

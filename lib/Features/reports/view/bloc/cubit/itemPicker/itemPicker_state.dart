part of 'itemPicker_cubit.dart';

class ReportState {
  List<String> data;

  ReportState({
    required this.data,
  });

  ReportState copyWith({
    bool? isAnim,
    double? valAnim,
    List<String>? data,
  }) {
    return ReportState(
      data: data ?? this.data,
    );
  }
}

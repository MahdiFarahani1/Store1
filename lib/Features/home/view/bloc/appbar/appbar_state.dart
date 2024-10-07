part of 'appbar_cubit.dart';

class AppbarState {
  bool isDropdownOpen;
  String imagePath;
  AppbarState({required this.imagePath, required this.isDropdownOpen});

  AppbarState copyWith({bool? isDropdownOpen, String? imagePath}) {
    return AppbarState(
        imagePath: imagePath ?? this.imagePath,
        isDropdownOpen: isDropdownOpen ?? this.isDropdownOpen);
  }
}

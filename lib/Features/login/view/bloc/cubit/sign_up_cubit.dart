import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState(passwordStrength: 0.0));

  void updatePasswordStrength(String value) {
    if (value.isEmpty) {
      emit(SignUpState(passwordStrength: 0.0));
    }
    if (value.length < 6 && value.isNotEmpty) {
      emit(SignUpState(passwordStrength: 0.2));
    } else if (value.length < 8 && value.isNotEmpty) {
      emit(SignUpState(passwordStrength: 0.5));
    } else if (RegExp(r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
      emit(SignUpState(passwordStrength: 1.0));
    } else if (value.isNotEmpty) {
      emit(SignUpState(passwordStrength: 0.7));
    }
  }

  Color getpasswordColor() {
    if (state.passwordStrength == 0.0) {
      return Colors.grey;
    }
    if (state.passwordStrength == 1.0) {
      return Colors.green.shade700;
    }
    if (state.passwordStrength <= 0.3) {
      return Colors.red;
    }
    if (state.passwordStrength <= 0.6) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
}

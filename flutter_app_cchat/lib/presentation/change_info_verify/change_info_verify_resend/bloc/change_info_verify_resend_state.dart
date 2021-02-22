import 'package:flutter/cupertino.dart';

class ChangeInfoVerifyResendState {
  final int time;
  final bool isTimeValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid => isTimeValid && time == 0;

  ChangeInfoVerifyResendState(
      {@required this.time,
      @required this.isTimeValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.message});

  factory ChangeInfoVerifyResendState.empty() {
    return ChangeInfoVerifyResendState(
        time: null,
        isTimeValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ChangeInfoVerifyResendState.loading() {
    return ChangeInfoVerifyResendState(
        time: 0,
        isTimeValid: false,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ChangeInfoVerifyResendState.failure({String message}) {
    return ChangeInfoVerifyResendState(
        time: 0,
        isTimeValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory ChangeInfoVerifyResendState.success({String message}) {
    return ChangeInfoVerifyResendState(
        time: 0,
        isTimeValid: false,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  ChangeInfoVerifyResendState update({
    @required int time,
    bool isTimeValid,
  }) {
    return copyWith(
      time: time,
      isTimeValid: isTimeValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  ChangeInfoVerifyResendState copyWith({
    @required int time,
    bool isTimeValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return ChangeInfoVerifyResendState(
      time: time,
      isTimeValid: isTimeValid ?? this.isTimeValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
}

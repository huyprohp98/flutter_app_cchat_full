import 'package:flutter/cupertino.dart';

class ChangeInfoVerifyState {
  final bool isOtpCodeValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String message;

  bool get isFormValid => isOtpCodeValid;

  ChangeInfoVerifyState(
      {@required this.isOtpCodeValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.message});

  factory ChangeInfoVerifyState.empty() {
    return ChangeInfoVerifyState(
        isOtpCodeValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ChangeInfoVerifyState.loading() {
    return ChangeInfoVerifyState(
        isOtpCodeValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        message: '');
  }

  factory ChangeInfoVerifyState.failure({String message}) {
    return ChangeInfoVerifyState(
        isOtpCodeValid: true,
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        message: message);
  }

  factory ChangeInfoVerifyState.success({String message}) {
    return ChangeInfoVerifyState(
        isOtpCodeValid: true,
        isSuccess: true,
        isSubmitting: false,
        isFailure: false,
        message: message);
  }

  ChangeInfoVerifyState update({
    bool isOtpCodeValid,
  }) {
    return copyWith(
      isOtpCodeValid: isOtpCodeValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  ChangeInfoVerifyState copyWith({
    bool isOtpCodeValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return ChangeInfoVerifyState(
      isOtpCodeValid: isOtpCodeValid ?? this.isOtpCodeValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }
}

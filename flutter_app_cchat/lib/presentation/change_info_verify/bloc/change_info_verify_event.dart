import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ChangeInfoVerifyEvent extends Equatable {
  const ChangeInfoVerifyEvent();

  @override
  List<Object> get props => [];
}

class UsernameChanged extends ChangeInfoVerifyEvent {
  final String username;

  const UsernameChanged({@required this.username});

  @override
  List<Object> get props => [username];

  @override
  String toString() {
    return 'UsernameChanged{username: $username}';
  }
}

class OtpCodeChanged extends ChangeInfoVerifyEvent {
  final String otpCode;

  OtpCodeChanged({@required this.otpCode});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'OtpCodeChanged{otpCode: $otpCode}';
  }
}

class RegisterVerifySubmitted extends ChangeInfoVerifyEvent {
  final String username;
  final String otpCode;

  const RegisterVerifySubmitted({
    @required this.username,
    @required this.otpCode,
  });

  @override
  List<Object> get props => [username, otpCode];

  @override
  String toString() {
    return 'RegisterVerifySubmitted{username: $username, password: $otpCode}';
  }
}

class ResendOtp extends ChangeInfoVerifyEvent {
  const ResendOtp();

  @override
  List<Object> get props => [];
}

import 'package:flutter_app_cchat/utils/dio/barrel_dio.dart';
import 'package:flutter/material.dart';

class ProfileDetailBackgroundImageState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final DioStatus status;

  bool get isValid => true;

  ProfileDetailBackgroundImageState({
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.status,
  });

  factory ProfileDetailBackgroundImageState.empty() {
    return ProfileDetailBackgroundImageState(
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory ProfileDetailBackgroundImageState.loading() {
    return ProfileDetailBackgroundImageState(
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        status: null);
  }

  factory ProfileDetailBackgroundImageState.failure({DioStatus status}) {
    return ProfileDetailBackgroundImageState(
        isSuccess: false,
        isSubmitting: false,
        isFailure: true,
        status: status);
  }

  factory ProfileDetailBackgroundImageState.success({DioStatus status}) {
    return ProfileDetailBackgroundImageState(
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        status: status);
  }

  ProfileDetailBackgroundImageState update({ DioStatus status}) {
    return copyWith(
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        status: status);
  }

  ProfileDetailBackgroundImageState copyWith({
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    DioStatus status,
  }) {
    return ProfileDetailBackgroundImageState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'ProfileDetailBackgroundImageState{isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure, status: $status}';
  }
}

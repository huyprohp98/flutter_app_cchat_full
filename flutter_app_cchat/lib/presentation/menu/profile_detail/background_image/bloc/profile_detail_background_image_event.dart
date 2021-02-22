import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ProfileDetailBackgroundImageEvent extends Equatable {
  const ProfileDetailBackgroundImageEvent();

  @override
  List<Object> get props => [];
}


class ProfileDetailBackgroundImageUploadEvent extends ProfileDetailBackgroundImageEvent {
  final File backgroundImageFile;

  ProfileDetailBackgroundImageUploadEvent(
      {@required this.backgroundImageFile});

  @override
  List<Object> get props => [backgroundImageFile];

  @override
  String toString() {
    return 'ProfileDetailBackgroundImageUploadEvent{backgroundImageFile: $backgroundImageFile}';
  }
}




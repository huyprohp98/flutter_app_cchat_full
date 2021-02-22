import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ProfileDetailEvent extends Equatable {
  const ProfileDetailEvent();

  List<Object> get props => [];
}

class OpenFullnameForm extends ProfileDetailEvent {}

class OpenPhoneForm extends ProfileDetailEvent {
}

class OpenEmailForm extends ProfileDetailEvent {
}

class OpenBirthdayForm extends ProfileDetailEvent {
}


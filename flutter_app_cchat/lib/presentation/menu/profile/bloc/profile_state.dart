import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/users.dart';
import 'package:flutter_app_cchat/utils/dio/barrel_dio.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final User user;
  final AppConfig appConfig;

  ProfileLoaded(this.user, this.appConfig); //  final User user;



  @override
  List<Object> get props => [user, appConfig];

  @override
  String toString() {
    return 'ProfileLoaded{user: $user, appConfig: $appConfig}';
  }
}

class ProfileNotLoaded extends ProfileState {
  final DioStatus error;

  ProfileNotLoaded(this.error);

  @override
  String toString() {
    return 'ProfileNotLoaded{error: $error}';
  }
}
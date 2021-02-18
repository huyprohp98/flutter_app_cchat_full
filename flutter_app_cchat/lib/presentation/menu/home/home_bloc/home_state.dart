import 'package:equatable/equatable.dart';
import 'package:flutter_app_cchat/model/api/response/home_response.dart';
import 'package:flutter_app_cchat/utils/dio/dio_status.dart';

abstract class HomeDataState extends Equatable {
  const HomeDataState();

  @override
  List<Object> get props => [];
}

class HomeDataLoading extends HomeDataState {}

class HomeDataLoaded extends HomeDataState {
  final HomeResponse homeResponse;

  const HomeDataLoaded({this.homeResponse});

  @override
  List<Object> get props => [homeResponse];

  @override
  String toString() {
    return 'HomeLoaded{homeResponse: $homeResponse}';
  }
}

class HomeDataNotLoaded extends HomeDataState {
  final DioStatus status;

  HomeDataNotLoaded({this.status});

  @override
  String toString() {
    return 'HomeNotLoaded{error: $status}';
  }
}

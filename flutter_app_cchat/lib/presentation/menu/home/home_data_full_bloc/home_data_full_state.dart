// import 'package:equatable/equatable.dart';
// import 'package:flutter_app_cchat/model/api/response/home_response.dart';
// import 'package:flutter_app_cchat/utils/dio/dio_status.dart';
//
// abstract class HomeDataFullState extends Equatable {
//   const HomeDataFullState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class HomeDataFullLoading extends HomeDataFullState {}
//
// class HomeDataFullLoaded extends HomeDataFullState {
//   final HomeResponse homeResponse;
//
//   const HomeDataFullLoaded({this.homeResponse});
//
//   @override
//   List<Object> get props => [homeResponse];
//
//   @override
//   String toString() {
//     return 'HomeLoaded{homeResponse: $homeResponse}';
//   }
// }
//
// class HomeDataNotFullLoaded extends HomeDataFullState {
//   final DioStatus status;
//
//   HomeDataNotFullLoaded({this.status});
//
//   @override
//   String toString() {
//     return 'HomeNotLoaded{error: $status}';
//   }
// }

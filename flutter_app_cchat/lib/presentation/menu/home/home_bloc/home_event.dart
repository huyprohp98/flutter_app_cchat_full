import 'package:equatable/equatable.dart';

class HomeDataEvent extends Equatable {
  const HomeDataEvent();

  List<Object> get props => [];
}

class LoadHomeData extends HomeDataEvent {}

class RefreshHomeData extends HomeDataEvent {}

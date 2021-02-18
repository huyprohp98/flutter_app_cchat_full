import 'package:flutter_app_cchat/model/repo/home_repository.dart';
import 'package:flutter_app_cchat/model/repo/user_repository.dart';
import 'package:flutter_app_cchat/utils/dio/dio_error_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class HomeDataBloc extends Bloc<HomeDataEvent, HomeDataState> {
  final HomeRepository homeRepository;
  final UserRepository userRepository;

  HomeDataBloc({@required this.homeRepository, this.userRepository});

  @override
  HomeDataState get initialState => HomeDataLoading();

  @override
  Stream<HomeDataState> mapEventToState(HomeDataEvent event) async* {
    if (event is LoadHomeData) {
      yield* _mapLoadHomeToState();
    } else if (event is RefreshHomeData) {
      yield HomeDataLoading();
      yield* _mapLoadHomeToState();
    }
  }

  Stream<HomeDataState> _mapLoadHomeToState() async* {
    try {
      final homeResponse = await homeRepository.getHomeData();
      print('-----------------');
      print(homeResponse);
      await Future.delayed(Duration(milliseconds: 500), () {});
      yield HomeDataLoaded(homeResponse: homeResponse);
    } catch (e) {
      yield HomeDataNotLoaded(status: DioErrorUtil.handleError(e));
    }
  }
}

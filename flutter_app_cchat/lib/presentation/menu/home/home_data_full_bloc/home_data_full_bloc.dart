// import 'package:flutter_app_cchat/model/repo/home_repository.dart';
// import 'package:flutter_app_cchat/model/repo/user_repository.dart';
// import 'package:flutter_app_cchat/utils/dio/dio_error_util.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
//
// import 'bloc.dart';
//
// class HomeDataFullBloc extends Bloc<HomeDataFullEvent, HomeDataFullState> {
//   final HomeRepository homeRepository;
//   final UserRepository userRepository;
//
//   HomeDataFullBloc({@required this.homeRepository, this.userRepository});
//
//   @override
//   HomeDataFullState get initialState => HomeDataFullLoading();
//
//   @override
//   Stream<HomeDataFullState> mapEventToState(HomeDataFullEvent event) async* {
//     if (event is LoadHomeDataFull) {
//       yield* _mapLoadHomeToState();
//     } else if (event is RefreshHomeDataFull) {
//       yield HomeDataFullLoading();
//       yield* _mapLoadHomeToState();
//     }
//   }
//
//   Stream<HomeDataFullState> _mapLoadHomeToState() async* {
//     try {
//       final homeResponse = await homeRepository.getHomeData();
//       print('-----------------');
//       print(homeResponse);
//       await Future.delayed(Duration(milliseconds: 500), () {});
//       yield HomeDataFullLoaded(homeResponse: homeResponse);
//     } catch (e) {
//       yield HomeDataNotFullLoaded(status: DioErrorUtil.handleError(e));
//     }
//   }
// }

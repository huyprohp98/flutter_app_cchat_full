import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/menu/profile/bloc/profile_event.dart';
import 'package:flutter_app_cchat/presentation/menu/profile/bloc/profile_state.dart';
import 'package:flutter_app_cchat/utils/dio/dio_error_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;

  ProfileBloc(
      {@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ProfileState get initialState => ProfileLoading();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadProfile) {
      yield ProfileLoading();
      yield* _mapLoadProfileToState();
    } else if (event is RefreshProfile) {
      yield ProfileLoading();
      yield* _mapLoadProfileToState();
    }
  }

  Stream<ProfileState> _mapLoadProfileToState() async* {
    try {
      final profileResponse = await _userRepository.getProfile();
      final appConfigResponse = await _userRepository.getAppConfigs();
      print('-----------------');
      yield ProfileLoaded(profileResponse.data, appConfigResponse.data.appConfigs);
    } catch (e) {
      yield ProfileNotLoaded(DioErrorUtil.handleError(e));
//      yield ProfileNotLoaded(e);
    }
  }
}

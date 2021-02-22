import 'dart:io';

import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/menu/profile_detail/avatar/bloc/profile_detail_avatar_event.dart';
import 'package:flutter_app_cchat/presentation/menu/profile_detail/avatar/bloc/profile_detail_avatar_state.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileDetailAvatarBloc extends Bloc<ProfileDetailAvatarEvent, ProfileDetailAvatarState> {
  final UserRepository _userRepository;

  ProfileDetailAvatarBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => ProfileDetailAvatarState.empty();

//  @override
//  Stream<Transition<ProfileDetailAvatarEvent, ProfileDetailAvatarState>> transformEvents(
//      Stream<ProfileDetailAvatarEvent> events, transitionFn) {
//    final nonDebounceStream = events.where((event) {
//      return (event is! FullBirthdayChanged);
//    });
//
//    final debounceStream = events.where((event) {
//      return (event is FullBirthdayChanged);
//    }).debounceTime(Duration(milliseconds: 300));
//
//    return super.transformEvents(
//        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
//  }

  @override
  Stream<ProfileDetailAvatarState> mapEventToState(ProfileDetailAvatarEvent event) async* {
    if (event is ProfileDetailAvatarUploadEvent) {
      yield* _mapProfileDetailAvatarUploadEventToState(event.avatarFile);
    }
  }

  Stream<ProfileDetailAvatarState> _mapProfileDetailAvatarUploadEventToState(File avatarFile) async* {
    try {
      yield ProfileDetailAvatarState.loading();

      var response = await _userRepository.updateAvatar(avatarFile: avatarFile);
      print('---token----');
      print(response);

      if (response.status == Endpoint.SUCCESS) {
        yield ProfileDetailAvatarState.success(
            status: DioStatus(
                message: response.message, code: DioStatus.API_SUCCESS_NOTIFY));
      } else {
        yield ProfileDetailAvatarState.failure(
            status: DioStatus(
                message: response.message, code: DioStatus.API_FAILURE_NOTIFY));
      }
    } catch (e) {
      yield ProfileDetailAvatarState.failure(status: DioErrorUtil.handleError(e));
    }
  }

//  Stream<ProfileDetailAvatarState> _mapFullBirthdayChangedToState(String Birthday) async* {
//    yield state.update(isBirthdayValid: Validator.isValidFullBirthday(Birthday));
//  }
}

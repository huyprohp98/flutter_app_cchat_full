import 'dart:io';

import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/menu/profile_detail/background_image/bloc/profile_detail_background_image_event.dart';
import 'package:flutter_app_cchat/presentation/menu/profile_detail/background_image/bloc/profile_detail_background_image_state.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileDetailBackgroundImageBloc extends Bloc<
    ProfileDetailBackgroundImageEvent, ProfileDetailBackgroundImageState> {
  final UserRepository _userRepository;

  ProfileDetailBackgroundImageBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => ProfileDetailBackgroundImageState.empty();

  @override
  Stream<ProfileDetailBackgroundImageState> mapEventToState(
      ProfileDetailBackgroundImageEvent event) async* {
    if (event is ProfileDetailBackgroundImageUploadEvent) {
      yield* _mapProfileDetailBackgroundImageUploadEventToState(
          event.backgroundImageFile);
    }
  }

  Stream<ProfileDetailBackgroundImageState>
      _mapProfileDetailBackgroundImageUploadEventToState(
          File backgroundImageFile) async* {
    try {
      yield ProfileDetailBackgroundImageState.loading();

      var response = await _userRepository.updateBackgroundImage(
          backgroundImageFile: backgroundImageFile);

      if (response.status == Endpoint.SUCCESS) {
        yield ProfileDetailBackgroundImageState.success(
            status: DioStatus(
                message: response.message, code: DioStatus.API_SUCCESS_NOTIFY));
      } else {
        yield ProfileDetailBackgroundImageState.failure(
            status: DioStatus(
                message: response.message, code: DioStatus.API_FAILURE_NOTIFY));
      }
    } catch (e) {
      yield ProfileDetailBackgroundImageState.failure(
          status: DioErrorUtil.handleError(e));
    }
  }
}

import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/change_info_verify/bloc/change_info_verify_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/profile/bloc/profile_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/profile/bloc/profile_event.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get/get.dart' as Get;

import 'email_form_event.dart';
import 'email_form_state.dart';

class EmailFormBloc extends Bloc<EmailFormEvent, EmailFormState> {
  final UserRepository _userRepository;

  EmailFormBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => EmailFormState.empty();

  @override
  Stream<Transition<EmailFormEvent, EmailFormState>> transformEvents(
      Stream<EmailFormEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged);
    });

    final debounceStream = events.where((event) {
      return (event is EmailChanged);
    }).debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<EmailFormState> mapEventToState(EmailFormEvent event) async* {
    if (event is EmailFormSubmitEvent) {
      yield* _mapEmailFormSubmitEventToState(event.email);
    } else if (event is EmailChanged) {
      yield* _mapFullnameChangedToState(event.email);
    }
  }

  Stream<EmailFormState> _mapEmailFormSubmitEventToState(String email) async* {
    try {
      yield EmailFormState.loading();

      var response = await _userRepository.updateEmailVerify(email: email);
      print('---token----');
      print(response);

      if (response.status == Endpoint.SUCCESS) {
        yield EmailFormState.success(
            status: DioStatus(
                message: response.message, code: DioStatus.API_SUCCESS_NOTIFY));
        Future.delayed(Duration(milliseconds: 300), () async {
          await AppNavigator.navigateChangeInfoVerify(
              username: email, type: ChangeInfoVerifyType.EMAIL);
          BlocProvider.of<ProfileBloc>(Get.Get.context).add(LoadProfile());
        });
      } else {
        yield EmailFormState.failure(
            status: DioStatus(
                message: response.message, code: DioStatus.API_FAILURE_NOTIFY));
      }
    } catch (e) {
      yield EmailFormState.failure(status: DioErrorUtil.handleError(e));
    }
  }

  Stream<EmailFormState> _mapFullnameChangedToState(String name) async* {
    yield state.update(isEmailValid: Validator.isValidFullname(name));
  }
}

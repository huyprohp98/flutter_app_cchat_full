import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'birthday_form_event.dart';
import 'birthday_form_state.dart';

class BirthdayFormBloc extends Bloc<BirthdayFormEvent, BirthdayFormState> {
  final UserRepository _userRepository;

  BirthdayFormBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  get initialState => BirthdayFormState.empty();

//  @override
//  Stream<Transition<BirthdayFormEvent, BirthdayFormState>> transformEvents(
//      Stream<BirthdayFormEvent> events, transitionFn) {
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
  Stream<BirthdayFormState> mapEventToState(BirthdayFormEvent event) async* {
    if (event is BirthdayFormSubmitEvent) {
      yield* _mapBirthdayFormSubmitEventToState(event.birthDay);
    }
  }

  Stream<BirthdayFormState> _mapBirthdayFormSubmitEventToState(String birthDay) async* {
    try {
      yield BirthdayFormState.loading();

      var response = await _userRepository.updateBirthDay(birthDay: birthDay);
      print('---token----');
      print(response);

      if (response.status == Endpoint.SUCCESS) {
        yield BirthdayFormState.success(
            status: DioStatus(
                message: response.message, code: DioStatus.API_SUCCESS_NOTIFY));
      } else {
        yield BirthdayFormState.failure(
            status: DioStatus(
                message: response.message, code: DioStatus.API_FAILURE_NOTIFY));
      }
    } catch (e) {
      yield BirthdayFormState.failure(status: DioErrorUtil.handleError(e));
    }
  }

//  Stream<BirthdayFormState> _mapFullBirthdayChangedToState(String Birthday) async* {
//    yield state.update(isBirthdayValid: Validator.isValidFullBirthday(Birthday));
//  }
}

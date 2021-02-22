import 'dart:async';

import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/change_info_verify/bloc/change_info_verify_bloc.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiver/async.dart';

import 'change_info_verify_resend_event.dart';
import 'change_info_verify_resend_state.dart';

class ChangeInfoVerifyResendBloc
    extends Bloc<ChangeInfoVerifyResendEvent, ChangeInfoVerifyResendState> {
  final UserRepository _userRepository;
  final ChangeInfoVerifyType _type;

  StreamSubscription _streamSubscription;

  ChangeInfoVerifyResendBloc(
      {@required UserRepository userRepository,
      @required ChangeInfoVerifyType type})
      : assert(userRepository != null),
        _type = type,
        _userRepository = userRepository;

  @override
  ChangeInfoVerifyResendState get initialState =>
      ChangeInfoVerifyResendState.empty();

  @override
  Stream<ChangeInfoVerifyResendState> mapEventToState(
      ChangeInfoVerifyResendEvent event) async* {
    if (event is TimeInit) {
      yield* _mapTimeInitToState(event.time);
    } else if (event is TimeChanged) {
      yield* _mapTimeChangeToState(event.time);
    } else if (event is RegisterResendOtp) {
      yield* _mapResendOtpToState(event.username);
    }
  }

  Stream<ChangeInfoVerifyResendState> _mapTimeInitToState(Duration time) async* {
    CountdownTimer _countDownTimer;
    _countDownTimer = new CountdownTimer(time, Duration(seconds: 1));
    _streamSubscription = _countDownTimer.listen(null);
    _streamSubscription.onData((duration) {
      print('time: ${duration.remaining.inSeconds}');
      this.add(TimeChanged(time: duration.remaining.inSeconds));
    });

    _streamSubscription.onDone(() async* {
      _streamSubscription.cancel();
    });
  }

  Stream<ChangeInfoVerifyResendState> _mapTimeChangeToState(int time) async* {
    yield state.update(
        time: time, isTimeValid: Validator.isValidResendOtp(time));
  }

  Stream<ChangeInfoVerifyResendState> _mapResendOtpToState(
      String username) async* {
    yield ChangeInfoVerifyResendState.loading();
    try {
      var response;
      if (_type == ChangeInfoVerifyType.EMAIL) {
        response = await _userRepository.updateEmailVerify(email: username);
      } else {
        response = await _userRepository.updatePhoneVerify(phone: username);
      }

      if (response.status == Endpoint.SUCCESS) {
        yield ChangeInfoVerifyResendState.success(message: response.message);
      } else {
        yield ChangeInfoVerifyResendState.failure(message: response.message);
      }
    } catch (e) {
      print(e.toString());
      yield ChangeInfoVerifyResendState.failure(message: e.toString());
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}

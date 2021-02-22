import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'change_info_verify_event.dart';
import 'change_info_verify_state.dart';

enum ChangeInfoVerifyType { EMAIL, PHONE }

class ChangeInfoVerifyBloc
    extends Bloc<ChangeInfoVerifyEvent, ChangeInfoVerifyState> {
  final UserRepository _userRepository;
  final ChangeInfoVerifyType _type;

  ChangeInfoVerifyBloc(
      {@required UserRepository userRepository,
      @required ChangeInfoVerifyType type})
      : assert(userRepository != null),
        _type = type,
        _userRepository = userRepository;

  @override
  ChangeInfoVerifyState get initialState => ChangeInfoVerifyState.empty();

  @override
  Stream<ChangeInfoVerifyState> mapEventToState(
      ChangeInfoVerifyEvent event) async* {
    if (event is OtpCodeChanged) {
      yield* _mapOtpCodeChangeToState(event.otpCode);
    } else if (event is RegisterVerifySubmitted) {
      yield* _mapFormSubmittedToState(event.username, event.otpCode);
    }
  }

  Stream<ChangeInfoVerifyState> _mapOtpCodeChangeToState(String otpCode) async* {
    yield state.update(isOtpCodeValid: Validator.isValidOtp(otpCode));
  }

  Stream<ChangeInfoVerifyState> _mapFormSubmittedToState(
      String username, String otpCode) async* {
    yield ChangeInfoVerifyState.loading();

    //need refactor
    var isOtpCodeValid = Validator.isValidOtp(otpCode);

    var newState = state.update(
      isOtpCodeValid: isOtpCodeValid,
    );

    yield newState;

    if (newState.isFormValid) {
      try {
        var response;
        if (this._type == ChangeInfoVerifyType.EMAIL) {
          response =
              await _userRepository.updateEmail(email: username, code: otpCode);
        } else {
          response =
              await _userRepository.updatePhone(phone: username, code: otpCode);
        }
        if (response.status == Endpoint.SUCCESS) {
          yield ChangeInfoVerifyState.success(message: response.message);
          Future.delayed(Duration(milliseconds: 2500), (){
            AppNavigator.navigateBack();
          });
        } else {
          yield ChangeInfoVerifyState.failure(message: response.message);
        }
      } catch (e) {
        print(e.toString());
        yield ChangeInfoVerifyState.failure(message: e.toString());
      }
    }
  }
}

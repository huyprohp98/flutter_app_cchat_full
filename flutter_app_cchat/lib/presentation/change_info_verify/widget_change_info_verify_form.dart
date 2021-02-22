import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../router.dart';
import 'bloc/change_info_verify_bloc.dart';
import 'bloc/change_info_verify_event.dart';
import 'bloc/change_info_verify_state.dart';
import 'change_info_verify_resend/bloc/change_info_verify_resend_bloc.dart';
import 'change_info_verify_resend/bloc/change_info_verify_resend_state.dart';

class WidgetRegisterVerifyForm extends StatefulWidget {
  final String username;

  const WidgetRegisterVerifyForm({Key key, @required this.username})
      : super(key: key);

  @override
  _WidgetRegisterVerifyFormState createState() =>
      _WidgetRegisterVerifyFormState();
}

class _WidgetRegisterVerifyFormState extends State<WidgetRegisterVerifyForm> {
  ChangeInfoVerifyBloc _registerVerifyBloc;

  TextEditingController _otpCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _registerVerifyBloc = BlocProvider.of<ChangeInfoVerifyBloc>(context);
    _otpCodeController.addListener(_onOtpCodeChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangeInfoVerifyBloc, ChangeInfoVerifyState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }

        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
        }

        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
        }
      },
      child: BlocBuilder<ChangeInfoVerifyResendBloc, ChangeInfoVerifyResendState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                  _buildCodeField(),
                  WidgetSpacer(
                    height: 10,
                  ),
                  _buildButtonVerify(state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool get isPopulated => _otpCodeController.text.isNotEmpty;

  bool isRegisterButtonEnabled() {
    return _registerVerifyBloc.state.isFormValid &&
        isPopulated &&
        !_registerVerifyBloc.state.isSubmitting;
  }

  _buildButtonVerify(ChangeInfoVerifyResendState state) {
    return WidgetLoginButton(
      onTap: () {
        if (isRegisterButtonEnabled()) {
          _registerVerifyBloc.add(RegisterVerifySubmitted(
            username: widget.username,
            otpCode: _otpCodeController.text,
          ));
          FocusScope.of(context).unfocus();
        }
      },
      isEnable: isRegisterButtonEnabled(),
      text: AppLocalizations.of(context).translate('register_verify.continue'),
    );
  }

  Widget _buildCodeField() {
    return PinCodeTextField(
      length: 6,
      obsecureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderWidth: 0,
        inactiveColor: AppColor.GREY_LIGHTER_3,
        inactiveFillColor: AppColor.GREY_LIGHTER_3,
        selectedColor: AppColor.GREY,
        selectedFillColor: AppColor.GREY,
        activeColor: AppColor.GREY_LIGHTER_3,
        activeFillColor: AppColor.GREY_LIGHTER_3,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      textInputType: TextInputType.number,
      controller: _otpCodeController,
      onCompleted: (v) {
        print("Completed");
      },
      onChanged: (value) {},
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }

  void _onOtpCodeChange() {
    _registerVerifyBloc.add(OtpCodeChanged(otpCode: _otpCodeController.text));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

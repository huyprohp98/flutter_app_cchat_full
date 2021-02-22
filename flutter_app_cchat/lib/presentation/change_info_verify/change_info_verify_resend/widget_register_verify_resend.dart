import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/change_info_verify_resend_bloc.dart';
import 'bloc/change_info_verify_resend_event.dart';
import 'bloc/change_info_verify_resend_state.dart';

class WidgetRegisterVerifyResend extends StatefulWidget {
  final String username;

  const WidgetRegisterVerifyResend({Key key, this.username}) : super(key: key);

  @override
  _WidgetRegisterVerifyResendState createState() =>
      _WidgetRegisterVerifyResendState();
}

class _WidgetRegisterVerifyResendState
    extends State<WidgetRegisterVerifyResend> {
  ChangeInfoVerifyResendBloc _changeInfoVerifyResendBloc;

  @override
  void initState() {
    super.initState();
    _changeInfoVerifyResendBloc =
        BlocProvider.of<ChangeInfoVerifyResendBloc>(context)
          ..add(TimeInit(time: AppValue.VERIFY_RESEND_TIME));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangeInfoVerifyResendBloc,
        ChangeInfoVerifyResendState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }

        if (state.isSuccess) {
          await GetSnackBarUtils.createSuccess(message: state.message);
          BlocProvider.of<ChangeInfoVerifyResendBloc>(context)
              .add(TimeInit(time: AppValue.VERIFY_RESEND_TIME));
        }

        if (state.isFailure) {
          GetSnackBarUtils.createError(message: state.message);
        }
      },
      child:
          BlocBuilder<ChangeInfoVerifyResendBloc, ChangeInfoVerifyResendState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [_buildContent(state)],
              ),
            ),
          );
        },
      ),
    );
  }

  bool isResendEnabled() {
    return _changeInfoVerifyResendBloc.state.isFormValid &&
        !_changeInfoVerifyResendBloc.state.isSubmitting;
  }

  Widget _buildContent(ChangeInfoVerifyResendState state) {
    if (state.time != null) {
      return WidgetResend(
        onTap: () {
          BlocProvider.of<ChangeInfoVerifyResendBloc>(context)
              .add(RegisterResendOtp(username: widget.username));
        },
        time: state.time,
        isValid: isResendEnabled(),
      );
    } else {
      return WidgetSpacer();
    }
  }
}

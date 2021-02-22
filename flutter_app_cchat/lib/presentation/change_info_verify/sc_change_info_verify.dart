import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/presentation/change_info_verify/widget_change_info_verify_appbar.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/change_info_verify_bloc.dart';
import 'change_info_verify_resend/bloc/bloc.dart';
import 'change_info_verify_resend/widget_register_verify_resend.dart';
import 'widget_change_info_verify_form.dart';
import 'widget_change_info_verify_username.dart';

class ChangeInfoVerifyScreen extends StatefulWidget {
  @override
  _ChangeInfoVerifyScreenState createState() => _ChangeInfoVerifyScreenState();
}

class _ChangeInfoVerifyScreenState extends State<ChangeInfoVerifyScreen> {
  String _username;
  ChangeInfoVerifyType _type;

  _onArgument() {
    Future.delayed(Duration.zero, () async {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      setState(() {
        _username = arguments['username'];
        _type = arguments['type'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _onArgument();
  }

  @override
  Widget build(BuildContext context) {
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    return WidgetTouchHideKeyBoard(
      child: SafeArea(
        child: Scaffold(
          body: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    ChangeInfoVerifyBloc(userRepository: userRepository, type: _type),
              ),
              BlocProvider(
                create: (context) =>
                    ChangeInfoVerifyResendBloc(userRepository: userRepository, type: _type),
              ),
            ],
            child: Container(
                color: AppColor.PRIMARY_BACKGROUND,
                child: Column(
                  children: [
                    _buildAppbar(),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              WidgetSpacer(height: 45,),
                              _buildUsername(),
                              _buildForm(),
                              _buildResend(),
                              WidgetSpacer(height: 20,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  _buildAppbar() => WidgetRegisterVerifyAppbar();

  _buildUsername() => WidgetRegisterVerifyUsername(
        username: _username,
      );

  _buildForm() => WidgetRegisterVerifyForm(username: _username);

  _buildResend() => WidgetRegisterVerifyResend(username: _username);
}

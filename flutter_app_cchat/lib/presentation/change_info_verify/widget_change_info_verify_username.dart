import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';

class WidgetRegisterVerifyUsername extends StatelessWidget {
  final String username;

  const WidgetRegisterVerifyUsername({Key key, @required this.username}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context).translate('register_verify.title'),
          style: AppStyle.DEFAULT_LARGE,
        ),

        WidgetSpacer(height: 15,),
        Text(
          '${AppCommonUtils.hideUserName(username)}',
          style: AppStyle.DEFAULT_MEDIUM,
        ),
      ],
    );
  }
}

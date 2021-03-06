import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter/material.dart';

class WidgetProfileAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WidgetAppbar(
        title: AppLocalizations.of(context).translate('profile.title').toUpperCase(),
      ),
    );
  }
}

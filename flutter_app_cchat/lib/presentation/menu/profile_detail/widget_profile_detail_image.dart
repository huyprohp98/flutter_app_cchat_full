import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

import 'barrel_profile_detail.dart';

class WidgetProfileDetailImage extends StatelessWidget {
  final String backgroundUrl;
  final String avatarUrl;


  const WidgetProfileDetailImage(
      {Key key, @required this.backgroundUrl, @required this.avatarUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              WidgetProfileDetailBackgroundImage(
                backgroundImageUrl: backgroundUrl,
              ),
              Container(
                color: Colors.white,
                child: AspectRatio(
                  aspectRatio: 3.25,
                ),
              ),
            ],
          ),
          WidgetProfileDetailAvatar(
            avatarUrl: avatarUrl,
          ),
        ],
      ),
    );
  }
}

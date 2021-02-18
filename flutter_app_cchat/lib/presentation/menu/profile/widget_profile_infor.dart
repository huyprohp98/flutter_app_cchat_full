import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetProfileInfor extends StatelessWidget {
  final Widget avatar;
  final String name;
  final String phone;
  final Function onTap;

  const WidgetProfileInfor(
      {Key key, this.avatar, this.name, this.phone, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Hero(
                        tag: 'avatar',
                        child: WidgetCircleAvatar(
                          image: avatar,
                        ),
                      ),
                    ),
                    WidgetSpacer(
                      width: 15,
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name.toUpperCase(),
                              style: AppStyle.DEFAULT_MEDIUM,
                            ),
                            WidgetSpacer(
                              height: 5,
                            ),
                            Text(
                              phone,
                              style: AppStyle.DEFAULT_SMALL,
                            )
                          ],
                        ),
                      ),
                    ),
                    WidgetSpacer(
                      width: 5,
                    ),
                    Icon(Icons.chevron_right, color: AppColor.GREY,)
                  ],
                ),
              ),
            ),
            WidgetSpacer(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cchat/model/entity/category_product_child.dart';

class WidgetTabBarTwo extends StatelessWidget {
  final Category category;
  final CategoryProductChild categoryChild;
  final bool isChoose;
  final Function(CategoryProductChild categoryChild) onTap;
  final TextStyle style;

  const WidgetTabBarTwo(
      {Key key, this.category, this.isChoose = false, this.onTap, this.style,this.categoryChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(categoryChild),
      child: Container(
        child: Stack(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  child: Text(
                    categoryChild.name,
                style: style,
                textAlign: TextAlign.center,
              )),
            )),
            isChoose
                ? Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FractionallySizedBox(
                        widthFactor: 0.5,
                        child: Divider(
                          color: AppColor.BLACK,
                          height: 0,
                          thickness: 1,
                        ),
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
// import 'package:flutter_app_cchat/model/entity/attr_color.dart';
// import 'package:flutter_app_cchat/model/entity/attr_size.dart';
// import 'package:flutter_app_cchat/model/entity/color_catergory_product_hot.dart';
// import 'package:flutter_app_cchat/model/entity/sizes.dart';
// import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
// import 'package:flutter_app_cchat/presentation/menu/home/category_primary/bloc/category_primary_two_bloc.dart';
// import 'package:flutter_app_cchat/presentation/menu/home/category_primary/bloc/category_primary_two_state.dart';
// import 'package:flutter_app_cchat/presentation/menu/home/category_product/bloc/post_category_product_bloc.dart';
// import 'package:flutter_app_cchat/presentation/menu/home/category_product/bloc/post_category_product_state.dart';
// import 'package:flutter_app_cchat/presentation/menu/home/home_data_full_bloc/home_data_full_bloc.dart';
// import 'package:flutter_app_cchat/presentation/menu/home/home_data_full_bloc/home_data_full_state.dart';
// import 'package:flutter_app_cchat/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class WidgetProductFilter extends StatelessWidget {
//   final double priceBegin;
//   final double priceEnd;
//   final ColorCatergoryProductHot color;
//   final Sizes size;
//   final ValueChanged<RangeValues> onSliderChange;
//   final ValueChanged<ColorCatergoryProductHot> onColorTap;
//   final ValueChanged<Sizes> onSizeTap;
//   final Function onCompleteTap;
//
//   const WidgetProductFilter(
//       {Key key,
//       @required this.priceBegin,
//       @required this.priceEnd,
//       @required this.onSliderChange,
//       this.onCompleteTap,
//       @required this.color,
//       @required this.size,
//       @required this.onColorTap,
//       @required this.onSizeTap})
//       : super(key: key);
//
//   static const double GRID_SPACING = 20;
//   static const double TITLE_MARGIN_TOP = 20;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CategoryPrimaryBloc, CategoryPrimaryState>(
//         builder: (context, state) {
//       if (state is CategoryPrimaryLoaded) {
//         return Container(
//           width: MediaQuery.of(context).size.width * 8 / 10,
//           color: AppColor.WHITE,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 20, horizontal: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _buildPrice(context, state),
//                         WidgetSpacer(
//                           height: 25,
//                         ),
//                         // _buildColor(context, state.products.colors),
//                         _buildColor(context, state.products[0].color),
//                         WidgetSpacer(
//                           height: 25,
//                         ),
//                         // _buildSize(context, state.products[0].size),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 color: AppColor.THIRD_COLOR,
//                 width: double.infinity,
//                 height: AppValue.ACTION_BAR_HEIGHT,
//                 child: FlatButton(
//                   onPressed: onCompleteTap,
//                   child: Text(
//                     AppLocalizations.of(context)
//                         .translate('category_primary.complete'),
//                     style:
//                         AppStyle.DEFAULT_MEDIUM.copyWith(color: AppColor.WHITE),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         );
//       } else if (state is CategoryPrimaryLoading) {
//         return Center(
//           child: WidgetCircleProgress(),
//         );
//       } else if (state is CategoryPrimaryNotLoaded) {
//         return Container();
//       } else {
//         return Center(
//           child: Text('Unknown state'),
//         );
//       }
//     });
//   }
//
//   Widget _buildSize(BuildContext context, List<Sizes> sizes) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           AppLocalizations.of(context).translate('category_primary.size'),
//           style: AppStyle.DEFAULT_MEDIUM_BOLD,
//         ),
//         WidgetSpacer(
//           height: TITLE_MARGIN_TOP,
//         ),
//         GridView.builder(
//           scrollDirection: Axis.vertical,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             return WidgetFilterAttr(
//               text: sizes[index].name,
//               isChoose: size == sizes[index],
//               onTap: () => onSizeTap(sizes[index]),
//             );
//           },
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               mainAxisSpacing: 5.0,
//               crossAxisSpacing: 5.0,
//               crossAxisCount: 3,
//               childAspectRatio: 2 / 0.75),
//           physics: BouncingScrollPhysics(),
//           itemCount: sizes.length,
//         ),
//       ],
//     );
//   }
//
//   Widget _buildColor(
//       BuildContext context, List<ColorCatergoryProductHot> colors) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           AppLocalizations.of(context).translate('category_primary.color'),
//           style: AppStyle.DEFAULT_MEDIUM_BOLD,
//         ),
//         WidgetSpacer(
//           height: TITLE_MARGIN_TOP,
//         ),
//         GridView.builder(
//           scrollDirection: Axis.vertical,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             return WidgetFilterAttr(
//               text: colors[index].name,
//               isChoose: color == colors[index],
//               onTap: () => onColorTap(colors[index]),
//             );
//           },
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               mainAxisSpacing: 5.0,
//               crossAxisSpacing: 5.0,
//               crossAxisCount: 3,
//               childAspectRatio: 2 / 0.75),
//           physics: BouncingScrollPhysics(),
//           itemCount: colors.length,
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPrice(BuildContext context, CategoryPrimaryState state) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           AppLocalizations.of(context).translate('category_primary.price'),
//           style: AppStyle.DEFAULT_MEDIUM_BOLD,
//         ),
//         WidgetSpacer(
//           height: TITLE_MARGIN_TOP,
//         ),
//         RangeSlider(
//           values: RangeValues(priceBegin, priceEnd),
//           min: AppValue.PRODUCT_FILTER_PRICE_BEGIN,
//           max: AppValue.PRODUCT_FILTER_PRICE_END,
//           divisions: AppValue.PRODUCT_FILTER_PRICE_END ~/
//               AppValue.PRODUCT_FILTER_STEP_PRICE,
// //                    showValueIndicator: true,
// //                    valueIndicatorMaxDecimals: 1,
//
//           labels: RangeLabels(
//               '${AppValue.APP_MONEY_FORMAT.format(priceBegin.toInt())}',
//               '${AppValue.APP_MONEY_FORMAT.format(priceEnd.toInt())}'),
//           onChanged: onSliderChange,
//           activeColor: AppColor.THIRD_COLOR,
//           inactiveColor: AppColor.GREY,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               AppValue.APP_MONEY_FORMAT
//                   .format(AppValue.PRODUCT_FILTER_PRICE_BEGIN),
//               style: AppStyle.DEFAULT_SMALL_BOLD,
//             ),
//             Text(
//               AppValue.APP_MONEY_FORMAT
//                   .format(AppValue.PRODUCT_FILTER_PRICE_END),
//               style: AppStyle.DEFAULT_SMALL_BOLD,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

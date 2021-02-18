import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar_main.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_product_filter_three.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_product_grid.dart';
import 'package:flutter_app_cchat/presentation/menu/home/home_bloc/home_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/home/home_bloc/home_event.dart';
import 'package:flutter_app_cchat/presentation/menu/home/home_bloc/home_state.dart';
import 'package:flutter_app_cchat/presentation/menu/home/home_data_full_bloc/home_data_full_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/home/home_data_full_bloc/home_data_full_state.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter_app_cchat/model/entity/category_product_child.dart';

import 'bloc/category_secondary_two_bloc.dart';
import 'bloc/category_secondary_two_event.dart';
import 'bloc/category_secondary_two_state.dart';

class CategorySecondaryTwoScreen extends StatefulWidget {
  @override
  _CategorySecondaryTwoScreenState createState() =>
      _CategorySecondaryTwoScreenState();
}

class _CategorySecondaryTwoScreenState extends State<CategorySecondaryTwoScreen> {
  CategoryProductChild _category;
  AttrColor _color;
  AttrSize _size;
  double _priceBegin = AppValue.PRODUCT_FILTER_PRICE_BEGIN;
  double _priceEnd = AppValue.PRODUCT_FILTER_PRICE_END;

  ItemScrollController _primaryScrollController = ItemScrollController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  _onRefresh() async {
    BlocProvider.of<CategorySecondaryTwoBloc>(context).add(
        RefreshCategoryTwoSecondary(
            _category, _size, _color, _priceBegin, _priceEnd));
  }

  _onLoadMore() async {
    BlocProvider.of<CategorySecondaryTwoBloc>(context).add(LoadCategoryTwoSecondary(
        _category, _size, _color, _priceBegin, _priceEnd));
  }

  _onArgument() {
    Future.delayed(Duration.zero, () async {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      setState(() {
        _category = arguments['category'];
        print('---_category---');
        print(_category);

        BlocProvider.of<CategorySecondaryTwoBloc>(context).add(
            LoadCategoryTwoSecondary(
                _category, _size, _color, _priceBegin, _priceEnd));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _onArgument();
    BlocProvider.of<HomeDataBloc>(context).add(LoadHomeData());

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<HomeDataBloc, HomeDataState>(
      builder: (context, state) {
        if (state is HomeDataLoaded) {
          return Scaffold(
            key: _drawerKey,
            backgroundColor: Colors.white,
            // drawer: Container(
            //   color: AppColor.WHITE,
            //   width: MediaQuery.of(context).size.width * 2.5 / 10,
            //   height: double.infinity,
            //   child: WidgetCategoriesVerticalDrawer(),
            // ),
            endDrawer: WidgetProductFilterThree(
              size: _size,
              color: _color,
              priceBegin: _priceBegin,
              priceEnd: _priceEnd,
              onSizeTap: (size) {
                if (_size != size) {
                  setState(() {
                    _size = size;
                  });
                } else {
                  setState(() {
                    _size = null;
                  });
                }
              },
              onColorTap: (color) {
                if (_color != color) {
                  setState(() {
                    _color = color;
                  });
                } else {
                  setState(() {
                    _color = null;
                  });
                }
              },
              onSliderChange: (value) {
                setState(() {
                  _priceBegin = value.start;
                  _priceEnd = value.end;
                });
              },
              onCompleteTap: () {
                BlocProvider.of<CategorySecondaryTwoBloc>(context).add(
                    FilterCategoryTwoSecondary(
                        _category, _size, _color, _priceBegin, _priceEnd));
                Get.back();
              },
            ),
            body: Container(
              child: Column(
                children: [_buildAppbar(), Expanded(child: _buildContent())],
              ),
            ),
          );
        } else if (state is HomeDataLoading) {
          return Center(
            child: WidgetCircleProgress(),
          );
        } else if (state is HomeDataNotLoaded) {
          return WidgetScreenError(
            status: state.status,
          );
        } else {
          return Center(
            child: Text('Unknown state'),
          );
        }
      },
    ));
  }

//

  Widget _buildContent() {
    return BlocListener<CategorySecondaryTwoBloc, CategorySecondaryTwoState>(
      listener: (context, state) {
        if (state is CategorySecondaryTwoLoaded) {
          if (state.hasReachedMax) {
            _refreshController.loadNoData();
          } else {
            _refreshController.loadComplete();
          }
        }
      },
      child: BlocBuilder<CategorySecondaryTwoBloc, CategorySecondaryTwoState>(
          builder: (context, state) {
        if (state is CategorySecondaryTwoLoaded) {
          return Column(
            children: [_buildMenuBar(), Expanded(child: _buildProduct(state))],
          );
        } else if (state is CategorySecondaryTwoLoading) {
          return Center(
            child: WidgetCircleProgress(),
          );
        } else if (state is CategorySecondaryNotTwoLoaded) {
          return Center(
            child: Text('${state.error}'),
          );
        } else {
          return Center(
            child: Text('Unknown state'),
          );
        }
      }),
    );
  }

  static final corner = 10.0;
  static final noCorner = corner / 2;
  static final paddingEven = EdgeInsets.only(
      left: corner, right: noCorner, top: noCorner, bottom: noCorner);
  static final paddingOdd = EdgeInsets.only(
      left: noCorner, right: corner, top: noCorner, bottom: noCorner);

  Widget _buildProduct(CategorySecondaryTwoLoaded state) {
    return Container(
      child: WidgetRefresher(
        refreshController: _refreshController,
        scrollDirection: Axis.vertical,
        onLoading: _onLoadMore,
        onRefresh: _onRefresh,
        child: WidgetWrapBuilder.build(
            itemBuilder: _itemBuilder, data: state.products),
      ),
    );
  }

  Widget _itemBuilder(list, context, index) {
    if(list == null) return WidgetProductGrid(empty: true,);
    return Container(
      child: Padding(
        padding: index % 2 == 0 ? paddingEven : paddingOdd,
        child: WidgetProductGrid(
          product: list[index],
          full: (index + 1) % 3 == 0,
        ),
      ),
    );
  }

  Widget _buildMenuBar() {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppValue.APP_HORIZONTAL_PADDING),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  width: AppValue.ACTION_BAR_HEIGHT,
                  height: AppValue.ACTION_BAR_HEIGHT,
                  child: WidgetAppbarMenu(
                    icon: Image.asset('assets/images/img_category.png'),
                    onTap: () {
                      _drawerKey.currentState.openDrawer();
                    },
                  )),
              Text(
                AppLocalizations.of(context)
                    .translate('category_secondary.category'),
                style: AppStyle.DEFAULT_MEDIUM,
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: AppValue.ACTION_BAR_HEIGHT,
                height: AppValue.ACTION_BAR_HEIGHT,
                alignment: Alignment.centerRight,
                child: Container(
                  width: AppValue.ACTION_BAR_HEIGHT * 0.85,
                  height: AppValue.ACTION_BAR_HEIGHT * 0.85,
                  child: WidgetAppbarMenu(
                    icon: Image.asset('assets/images/img_filter.png'),
                    onTap: () {
                      _drawerKey.currentState.openEndDrawer();
                    },
                  ),
                ),
              ),
              Text(
                AppLocalizations.of(context)
                    .translate('category_secondary.filter'),
                style: AppStyle.DEFAULT_MEDIUM,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAppbar() => WidgetAppBarMain(
        actionBack: () {
          AppNavigator.navigateBack();
        },
        canSearch: false,
        title:
            '${AppLocalizations.of(context).translate('category_primary.title')} ${_category?.name ?? ''}',
      );
}

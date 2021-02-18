import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_appbar_main.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_product_filter_three.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_product_grid.dart';
import 'package:flutter_app_cchat/presentation/menu/home/home_bloc/home_bloc.dart';
import 'package:flutter_app_cchat/presentation/menu/home/home_bloc/home_event.dart';
import 'package:flutter_app_cchat/presentation/menu/home/home_bloc/home_state.dart';
import 'package:flutter_app_cchat/utils/locale/app_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter_app_cchat/presentation/common_widgets/widget_tab_bar_two.dart';
import 'bloc/category_primary_two_bloc.dart';
import 'bloc/category_primary_two_event.dart';
import 'bloc/category_primary_two_state.dart';
import 'package:flutter_app_cchat/model/entity/category_product_child.dart';

class CategoryPrimaryTwoScreen extends StatefulWidget {
  @override
  _CategoryPrimaryTwoScreenState createState() =>
      _CategoryPrimaryTwoScreenState();
}

class _CategoryPrimaryTwoScreenState extends State<CategoryPrimaryTwoScreen> {
  Category _category;
  AttrColor _color;
  AttrSize _size;
  double _priceBegin = AppValue.PRODUCT_FILTER_PRICE_BEGIN;
  double _priceEnd = AppValue.PRODUCT_FILTER_PRICE_END;

  ItemScrollController _primaryScrollController = ItemScrollController();
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  _onRefresh() async {
    BlocProvider.of<CategoryPrimaryTwoBloc>(context).add(
        RefreshCategoryTwoPrimary(
            _category, _size, _color, _priceBegin, _priceEnd));
  }

  _onLoadMore() async {
    BlocProvider.of<CategoryPrimaryTwoBloc>(context).add(LoadCategoryTwoPrimary(
        _category, _size, _color, _priceBegin, _priceEnd));
  }

  _onArgument() {
    Future.delayed(Duration.zero, () async {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      setState(() {
        _category = arguments['category'];

        BlocProvider.of<CategoryPrimaryTwoBloc>(context).add(
            LoadCategoryTwoPrimary(
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
                BlocProvider.of<CategoryPrimaryTwoBloc>(context).add(
                    FilterCategoryTwoPrimary(
                        _category, _size, _color, _priceBegin, _priceEnd));
                Get.back();
              },
            ),
            body: Container(
              child: Column(
                children: [
                  _buildAppbar(),
                  _buildPrimaryCategory(state),
                  Expanded(child: _buildContent())
                ],
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
    return BlocListener<CategoryPrimaryTwoBloc, CategoryPrimaryTwoState>(
      listener: (context, state) {
        if (state is CategoryPrimaryTwoLoaded) {
          if (state.hasReachedMax) {
            _refreshController.loadNoData();
          } else {
            _refreshController.loadComplete();
          }
        }
      },
      child: BlocBuilder<CategoryPrimaryTwoBloc, CategoryPrimaryTwoState>(
          builder: (context, state) {
            if (state is CategoryPrimaryTwoLoaded) {
              return Column(
                children: [
                  _buildSecondaryCategory(state),
                  Expanded(child: _buildProduct(state))
                ],
              );
            } else if (state is CategoryPrimaryTwoLoading) {
              return Center(
                child: WidgetCircleProgress(),
              );
            } else if (state is CategoryPrimaryNotTwoLoaded) {
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

  Widget _buildProduct(CategoryPrimaryTwoLoaded state) {
    return Container(
      child: WidgetRefresher(
          refreshController: _refreshController,
          scrollDirection: Axis.vertical,
          onLoading: _onLoadMore,
          onRefresh: _onRefresh,
          child: WidgetWrapBuilder.build(
              itemBuilder: _itemBuilder, data: state.products ?? [])),
    );
  }

  Widget _itemBuilder(list, context, index) {
    if (list == null)
      return WidgetProductGrid(
        empty: true,
      );
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

  Widget _buildSecondaryCategory(CategoryPrimaryTwoLoaded state) {
    if (state.category.child != null) {
      print(state.category);
      if (state.category.child.isNotEmpty) {
        return Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _buildDotLine(),
              ),
            ),
            Container(
                height: AppValue.ACTION_BAR_HEIGHT,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // return WidgetTabBar(
                    //   category: state.category.child[index],
                    //   onTap: (Category category) {
                    //     AppNavigator.navigateCategorySecondary(
                    //         state.category.child[index]);
                    //   },
                    //   style: AppStyle.DEFAULT_SMALL_BOLD
                    //       .copyWith(color: AppColor.PRIMARY),
                    // );
                    // return WidgetTabBarTwo (
                    //   categoryChild: state.category.child[index],
                    //   onTap: (Category category) {
                    //     setState(() {
                    //       AppNavigator.navigateCategorySecondary(
                    //           state.category);
                    //     });
                    //     BlocProvider.of<CategoryPrimaryTwoBloc>(context).add(
                    //         ChangeCategoryTwoPrimary(_category, _size, _color,
                    //             _priceBegin, _priceEnd));
                    //
                    //     _primaryScrollController.scrollTo(
                    //         index: index,
                    //         duration: Duration(milliseconds: 200),
                    //         curve: Curves.linear);
                    //   },
                    //   style: AppStyle.DEFAULT_MEDIUM,
                    //   isChoose: _category ==
                    //       state.category.child[index],
                    // );
                    return WidgetTabBarTwo(
                      categoryChild: state.category.child[index],
                      onTap: (CategoryProductChild category) {
                        AppNavigator.navigateCategorySecondary(
                            state.category.child[index]);
                      },
                      style: AppStyle.DEFAULT_SMALL_BOLD
                          .copyWith(color: AppColor.PRIMARY),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return WidgetSpacer(width: 0);
                  },
                  physics: BouncingScrollPhysics(),
                  itemCount: state.category.child.length,
                )),
          ],
        );
      }
    }
    return SizedBox();
  }

  Widget _buildPrimaryCategory(HomeDataLoaded state) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: _buildDotLine(),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                  height: AppValue.ACTION_BAR_HEIGHT,
                  child: ScrollablePositionedList.builder(
                    initialScrollIndex: state.homeResponse.data.category
                        .indexOf(_category) !=
                        -1
                        ? state.homeResponse.data.category.indexOf(_category)
                        : 0,
                    itemScrollController: _primaryScrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return WidgetTabBar(
                        category: state.homeResponse.data.category[index],
                        onTap: (Category category) {
                          setState(() {
                            _category = category;
                          });
                          BlocProvider.of<CategoryPrimaryTwoBloc>(context).add(
                              ChangeCategoryTwoPrimary(_category, _size, _color,
                                  _priceBegin, _priceEnd));

                          _primaryScrollController.scrollTo(
                              index: index,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.linear);
                        },
                        style: AppStyle.DEFAULT_MEDIUM,
                        isChoose: _category ==
                            state.homeResponse.data.category[index],
                      );
                    },
                    physics: BouncingScrollPhysics(),
                    itemCount: state.homeResponse.data.category.length,
                  )),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              width: AppValue.ACTION_BAR_HEIGHT,
              height: AppValue.ACTION_BAR_HEIGHT,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: AppColor.GREY_LIGHTER_3,
                      spreadRadius: .2,
                      blurRadius: 20)
                ],
              ),
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
            )
          ],
        ),
      ],
    );
  }

  Widget _buildDotLine() => DottedBorder(
    padding: const EdgeInsets.only(),
    strokeWidth: 0.5,
    color: AppColor.GREY,
    child: Container(
      height: 0.1,
      width: double.maxFinite,
    ),
  );

  Widget _buildAppbar() => WidgetAppBarMain(
    canSearch: false,
    actionBack: () {
      Navigator.pop(context);
    },
    title:
    '${AppLocalizations.of(context).translate('category_primary.title')} ${_category?.name ?? ""}',
  );
}

import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'category_primary_two_event.dart';
import 'category_primary_two_state.dart';

class CategoryPrimaryTwoBloc
    extends Bloc<CategoryPrimaryTwoEvent, CategoryPrimaryTwoState> {
  final HomeRepository homeRepository;

  CategoryPrimaryTwoBloc({@required this.homeRepository});

  @override
  CategoryPrimaryTwoState get initialState => CategoryPrimaryTwoLoading();

  @override
  Stream<CategoryPrimaryTwoState> mapEventToState(
      CategoryPrimaryTwoEvent event) async* {
    if (event is FilterCategoryTwoPrimary) {
      yield CategoryPrimaryTwoLoading();
      print('event is FilterCategoryTwoPrimary');
      print('event.priceBegin ${event.priceBegin}');
      print('event.priceEnd ${event.priceEnd}');
      yield* _mapLoadingState(event.category, event.size, event.color,
          event.priceBegin, event.priceEnd);
    }
    if (event is ChangeCategoryTwoPrimary) {
      yield CategoryPrimaryTwoLoading();
      yield* _mapLoadingState(event.category, event.size, event.color,
          event.priceBegin, event.priceEnd);
    }
    if (event is LoadCategoryTwoPrimary) {
//      yield CategoryPrimaryTwoLoading();
      yield* _mapLoadingState(event.category, event.size, event.color,
          event.priceBegin, event.priceEnd);
    } else if (event is RefreshCategoryTwoPrimary) {
      yield CategoryPrimaryTwoLoading();
      yield* _mapLoadingState(event.category, event.size, event.color,
          event.priceBegin, event.priceEnd);
    }
  }

  Stream<CategoryPrimaryTwoState> _mapLoadingState(
      Category category,
      AttrSize size,
      AttrColor color,
      double priceBegin,
      double priceEnd) async* {
    final currentState = state;
    try {
      if (state is CategoryPrimaryTwoLoading) {
        final products = await _fetchProduct(
            limit: Endpoint.DEFAULT_LIMIT,
            offset: 0,
            categoryId: category.id,
            colorId: color != null ? color.id : null,
            sizeId: size != null ? size.id : null,
            priceBegin: priceBegin,
            priceEnd: priceEnd);
        yield CategoryPrimaryTwoLoaded(
            products: products, category: category, hasReachedMax: false);
      }
      if (currentState is CategoryPrimaryTwoLoaded) {
        final products = await _fetchProduct(
            limit: Endpoint.DEFAULT_LIMIT,
            offset: currentState.products.length,
            categoryId: category.id,
            colorId: color != null ? color.id : null,
            sizeId: size != null ? size.id : null,
            priceBegin: priceBegin,
            priceEnd: priceEnd);
        yield products.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : CategoryPrimaryTwoLoaded(
                products: currentState.products + products,
                hasReachedMax: false,
              );
      }
    } catch (e) {
      print(e);
      yield CategoryPrimaryNotTwoLoaded('$e');
    }
  }

  Future<List<CategoryProductHotData>> _fetchProduct(
      {@required int limit,
      @required int offset,
      @required int categoryId,
      int sizeId,
      int colorId,
      double priceBegin,
      double priceEnd}) async {
    try {
      final response = await homeRepository.getProductByAttr(
          limit: limit,
          offset: offset,
          categoryId: categoryId,
          sizeId: sizeId,
          colorId: colorId,
          priceBegin: priceBegin,
          priceEnd: priceEnd);
      return response.data.list;
    } catch (e) {
      throw Exception('$e');
    }
  }
}

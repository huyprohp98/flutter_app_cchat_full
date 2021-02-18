import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_app_cchat/model/entity/category_product_child.dart';

import 'category_secondary_two_event.dart';
import 'category_secondary_two_state.dart';

class CategorySecondaryTwoBloc
    extends Bloc<CategorySecondaryTwoEvent, CategorySecondaryTwoState> {
  final HomeRepository homeRepository;

  CategorySecondaryTwoBloc({@required this.homeRepository});

  @override
  CategorySecondaryTwoState get initialState => CategorySecondaryTwoLoading();

  @override
  Stream<CategorySecondaryTwoState> mapEventToState(
      CategorySecondaryTwoEvent event) async* {
    if (event is FilterCategoryTwoSecondary) {
      yield CategorySecondaryTwoLoading();
      print('event is FilterCategoryTwoSecondary');
      print('event.priceBegin ${event.priceBegin}');
      print('event.priceEnd ${event.priceEnd}');
      yield* _mapLoadingState(event.category, event.size, event.color,
          event.priceBegin, event.priceEnd);
    }
    if (event is ChangeCategoryTwoSecondary) {
      yield CategorySecondaryTwoLoading();
      yield* _mapLoadingState(event.category, event.size, event.color,
          event.priceBegin, event.priceEnd);
    }
    if (event is LoadCategoryTwoSecondary) {
//      yield CategorySecondaryTwoLoading();
      yield* _mapLoadingState(event.category, event.size, event.color,
          event.priceBegin, event.priceEnd);
    } else if (event is RefreshCategoryTwoSecondary) {
      yield CategorySecondaryTwoLoading();
      yield* _mapLoadingState(event.category, event.size, event.color,
          event.priceBegin, event.priceEnd);
    }
  }

  Stream<CategorySecondaryTwoState> _mapLoadingState(
      CategoryProductChild category,
      AttrSize size,
      AttrColor color,
      double priceBegin,
      double priceEnd) async* {
    final currentState = state;
    try {
      if (state is CategorySecondaryTwoLoading) {
        final products = await _fetchProduct(
            limit: Endpoint.DEFAULT_LIMIT,
            offset: 0,
            categoryId: category.id,
            colorId: color != null ? color.id : null,
            sizeId: size != null ? size.id : null,
            priceBegin: priceBegin,
            priceEnd: priceEnd);
        yield CategorySecondaryTwoLoaded(
            products: products, category: category, hasReachedMax: false);
      }
      if (currentState is CategorySecondaryTwoLoaded) {
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
            : CategorySecondaryTwoLoaded(
                products: currentState.products + products,
                hasReachedMax: false,
              );
      }
    } catch (e) {
      print(e);
      yield CategorySecondaryNotTwoLoaded('$e');
    }
  }

//  Stream<CategorySecondaryTwoState> _mapLoadCategoryTwoSecondaryToState(
//      LoadCategoryTwoSecondary event) async* {
//    final currentState = state;
//    try {
//      if (state is CategorySecondaryTwoLoading) {
//        final products = await _fetchProduct(
//            limit: Endpoint.DEFAULT_LIMIT,
//            offset: 0,
//            categoryId: event.category.id);
//        yield CategorySecondaryTwoLoaded(
//            products: products, category: event.category, hasReachedMax: false);
//      }
//      if (currentState is CategorySecondaryTwoLoaded) {
//        final products = await _fetchProduct(
//            limit: Endpoint.DEFAULT_LIMIT,
//            offset: currentState.products.length,
//            categoryId: event.category.id);
//        yield products.isEmpty
//            ? currentState.copyWith(hasReachedMax: true)
//            : CategorySecondaryTwoLoaded(
//                products: currentState.products + products,
//                hasReachedMax: false,
//              );
//      }
//    } catch (e) {
//      print(e);
//      yield CategorySecondaryNotTwoLoaded('$e');
//    }
//  }
//
//  Stream<CategorySecondaryTwoState> _mapRefreshCategoryTwoSecondaryToState(
//      RefreshCategoryTwoSecondary event) async* {
//    final currentState = state;
//    try {
//      if (state is CategorySecondaryTwoLoading) {
//        final products = await _fetchProduct(
//            limit: Endpoint.DEFAULT_LIMIT,
//            offset: 0,
//            categoryId: event.category.id);
//        yield CategorySecondaryTwoLoaded(
//            products: products, category: event.category, hasReachedMax: false);
//      }
//      if (currentState is CategorySecondaryTwoLoaded) {
//        final products = await _fetchProduct(
//            limit: Endpoint.DEFAULT_LIMIT,
//            offset: currentState.products.length,
//            categoryId: event.category.id);
//        yield products.isEmpty
//            ? currentState.copyWith(hasReachedMax: true)
//            : CategorySecondaryTwoLoaded(
//                products: currentState.products + products,
//                hasReachedMax: false,
//              );
//      }
//    } catch (e) {
//      print(e);
//      yield CategorySecondaryNotTwoLoaded('$e');
//    }
//  }

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

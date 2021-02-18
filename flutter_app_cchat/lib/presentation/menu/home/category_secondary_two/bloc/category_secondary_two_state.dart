import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/category_product_child.dart';

abstract class CategorySecondaryTwoState extends Equatable {
  const CategorySecondaryTwoState();

  @override
  List<Object> get props => [];
}

class CategorySecondaryTwoLoading extends CategorySecondaryTwoState {}

class CategorySecondaryTwoLoaded extends CategorySecondaryTwoState {
  final List<CategoryProductHotData> products;
  final CategoryProductChild category;
  final bool hasReachedMax;

  const CategorySecondaryTwoLoaded({this.products, this.category, this.hasReachedMax});

  CategorySecondaryTwoLoaded copyWith({
    List<CategoryProductHotData> products,
    CategoryProductChild category,
    bool hasReachedMax,
  }) {
    return CategorySecondaryTwoLoaded(
      products: products ?? this.products,
      category: category ?? this.category,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [products, category, hasReachedMax];

  @override
  String toString() {
    return 'CategorySecondaryTwoLoaded{products: $products, category: $category, hasReachedMax: $hasReachedMax}';
  }
}

class CategorySecondaryNotTwoLoaded extends CategorySecondaryTwoState {
  final String error;

  CategorySecondaryNotTwoLoaded(this.error);

  @override
  String toString() {
    return 'CategorySecondaryNotTwoLoaded{error: $error}';
  }
}
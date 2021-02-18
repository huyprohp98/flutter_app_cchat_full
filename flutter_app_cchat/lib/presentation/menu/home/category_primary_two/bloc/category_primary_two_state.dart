import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';

abstract class CategoryPrimaryTwoState extends Equatable {
  const CategoryPrimaryTwoState();

  @override
  List<Object> get props => [];
}

class CategoryPrimaryTwoLoading extends CategoryPrimaryTwoState {}

class CategoryPrimaryTwoLoaded extends CategoryPrimaryTwoState {
  final List<CategoryProductHotData> products;
  final Category category;
  final bool hasReachedMax;

  const CategoryPrimaryTwoLoaded({this.products, this.category, this.hasReachedMax});

  CategoryPrimaryTwoLoaded copyWith({
    List<CategoryProductHotData> products,
    Category category,
    bool hasReachedMax,
  }) {
    return CategoryPrimaryTwoLoaded(
      products: products ?? this.products,
      category: category ?? this.category,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [products, category, hasReachedMax];

  @override
  String toString() {
    return 'CategoryPrimaryTwoLoaded{products: $products, category: $category, hasReachedMax: $hasReachedMax}';
  }
}

class CategoryPrimaryNotTwoLoaded extends CategoryPrimaryTwoState {
  final String error;

  CategoryPrimaryNotTwoLoaded(this.error);

  @override
  String toString() {
    return 'CategoryPrimaryNotTwoLoaded{error: $error}';
  }
}
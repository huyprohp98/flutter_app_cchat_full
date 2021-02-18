import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_cchat/model/entity/category_product_child.dart';

class CategorySecondaryTwoEvent extends Equatable {
  const CategorySecondaryTwoEvent();

  List<Object> get props => [];
}

class ChangeCategoryTwoSecondary extends CategorySecondaryTwoEvent {
  final CategoryProductChild category;
  final AttrSize size;
  final AttrColor color;
  final double priceBegin;
  final double priceEnd;

  ChangeCategoryTwoSecondary(
      this.category, this.size, this.color, this.priceBegin, this.priceEnd);

  @override
  List<Object> get props => [category, size, color, priceBegin, priceEnd];

  @override
  String toString() {
    return 'ChangeCategoryTwoSecondary{category: $category, size: $size, color: $color, priceBegin: $priceBegin, priceEnd: $priceEnd}';
  }
}

class FilterCategoryTwoSecondary extends CategorySecondaryTwoEvent {
  final CategoryProductChild category;
  final AttrSize size;
  final AttrColor color;
  final double priceBegin;
  final double priceEnd;

  FilterCategoryTwoSecondary(
      this.category, this.size, this.color, this.priceBegin, this.priceEnd);

  @override
  List<Object> get props => [category, size, color, priceBegin, priceEnd];

  @override
  String toString() {
    return 'FilterCategoryTwoSecondary{category: $category, size: $size, color: $color, priceBegin: $priceBegin, priceEnd: $priceEnd}';
  }
}

class LoadCategoryTwoSecondary extends CategorySecondaryTwoEvent {
  final CategoryProductChild category;
  final AttrSize size;
  final AttrColor color;
  final double priceBegin;
  final double priceEnd;

  LoadCategoryTwoSecondary(
      this.category, this.size, this.color, this.priceBegin, this.priceEnd);

  @override
  List<Object> get props => [category, size, color, priceBegin, priceEnd];

  @override
  String toString() {
    return 'LoadCategoryTwoSecondary{category: $category, size: $size, color: $color, priceBegin: $priceBegin, priceEnd: $priceEnd}';
  }
}

class RefreshCategoryTwoSecondary extends CategorySecondaryTwoEvent {
  final CategoryProductChild category;
  final AttrSize size;
  final AttrColor color;
  final double priceBegin;
  final double priceEnd;

  RefreshCategoryTwoSecondary(
      this.category, this.size, this.color, this.priceBegin, this.priceEnd);

  @override
  List<Object> get props => [category, size, color, priceBegin, priceEnd];

  @override
  String toString() {
    return 'RefreshCategoryTwoSecondary{category: $category, size: $size, color: $color, priceBegin: $priceBegin, priceEnd: $priceEnd}';
  }
}

import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryPrimaryTwoEvent extends Equatable {
  const CategoryPrimaryTwoEvent();

  List<Object> get props => [];
}

class ChangeCategoryTwoPrimary extends CategoryPrimaryTwoEvent {
  final Category category;
  final AttrSize size;
  final AttrColor color;
  final double priceBegin;
  final double priceEnd;

  ChangeCategoryTwoPrimary(
      this.category, this.size, this.color, this.priceBegin, this.priceEnd);

  @override
  List<Object> get props => [category, size, color, priceBegin, priceEnd];

  @override
  String toString() {
    return 'ChangeCategoryTwoPrimary{category: $category, size: $size, color: $color, priceBegin: $priceBegin, priceEnd: $priceEnd}';
  }
}

class FilterCategoryTwoPrimary extends CategoryPrimaryTwoEvent {
  final Category category;
  final AttrSize size;
  final AttrColor color;
  final double priceBegin;
  final double priceEnd;

  FilterCategoryTwoPrimary(
      this.category, this.size, this.color, this.priceBegin, this.priceEnd);

  @override
  List<Object> get props => [category, size, color, priceBegin, priceEnd];

  @override
  String toString() {
    return 'FilterCategoryTwoPrimary{category: $category, size: $size, color: $color, priceBegin: $priceBegin, priceEnd: $priceEnd}';
  }
}

class LoadCategoryTwoPrimary extends CategoryPrimaryTwoEvent {
  final Category category;
  final AttrSize size;
  final AttrColor color;
  final double priceBegin;
  final double priceEnd;

  LoadCategoryTwoPrimary(
      this.category, this.size, this.color, this.priceBegin, this.priceEnd);

  @override
  List<Object> get props => [category, size, color, priceBegin, priceEnd];

  @override
  String toString() {
    return 'LoadCategoryTwoPrimary{category: $category, size: $size, color: $color, priceBegin: $priceBegin, priceEnd: $priceEnd}';
  }
}

class RefreshCategoryTwoPrimary extends CategoryPrimaryTwoEvent {
  final Category category;
  final AttrSize size;
  final AttrColor color;
  final double priceBegin;
  final double priceEnd;

  RefreshCategoryTwoPrimary(
      this.category, this.size, this.color, this.priceBegin, this.priceEnd);

  @override
  List<Object> get props => [category, size, color, priceBegin, priceEnd];

  @override
  String toString() {
    return 'RefreshCategoryTwoPrimary{category: $category, size: $size, color: $color, priceBegin: $priceBegin, priceEnd: $priceEnd}';
  }
}

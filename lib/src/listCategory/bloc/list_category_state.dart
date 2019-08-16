import 'package:flutter_bloc_sample/src/listCategory/bloc/category.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListCategoryState {}
  
class InitialListCategoryState extends ListCategoryState {}
class ListCategoryLoaded extends ListCategoryState {
  final List<CategoryFeatured> listCate;
  ListCategoryLoaded(this.listCate);
}

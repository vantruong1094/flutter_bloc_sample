import 'package:meta/meta.dart';

@immutable
abstract class ListCategoryEvent {}

class FetchListCategory extends ListCategoryEvent {}

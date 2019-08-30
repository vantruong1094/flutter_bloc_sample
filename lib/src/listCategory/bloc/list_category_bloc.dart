import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_sample/src/listCategory/bloc/category.dart';
import 'package:flutter_bloc_sample/src/repository/list_category_repo.dart';
import './bloc.dart';

class ListCategoryBloc extends Bloc<ListCategoryEvent, ListCategoryState> {
  @override
  ListCategoryState get initialState => InitialListCategoryState();

  @override
  Stream<ListCategoryState> mapEventToState(
    ListCategoryEvent event,
  ) async* {
    if (event is FetchListCategory) {
      final listFeatured = await _getListCategory();
      yield ListCategoryLoaded(listFeatured);
    }
  }

  // Stream<ListCategoryState> _mapResultItemsIntoCategory(Category c, List<Category> categories) async* {
  //   List<Category> listCateItem = await _getListItemsOfCategory(c, categories);
  //   yield ListCategoryLoaded(listCateItem);
  // }

  Future<List<CategoryFeatured>> _getListCategory() async {
    final repo = ListCategoryRepo();
    return await repo.getListCategoryFeatured();
  }

  // Future<List<Category>> _getListItemsOfCategory(Category c, List<Category> categories) async {
  //   final response = await http.get("http://api.stg.viibee.jp/api/v1/videos?cid=${c.id}&page=1&per_page=10");
  //   if (response.statusCode == 200) {
  //     List<String> items = List();
  //     final data = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
  //     final dataArray = data["data"];
  //     dataArray.forEach((json) {
  //       items.add(json["video_top_image_url"]);
  //     });
  //     c.items = items;
  //     return categories;
  //   }
  //   return categories;
  // }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_sample/src/listCategory/bloc/category.dart';
import './bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    final response = await http.get("https://unsplash.com/napi/collections/featured");
    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      return data.map((raw) {
        return CategoryFeatured.fromJson(raw);
      }).toList();
    } else {
      return [];
    }
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

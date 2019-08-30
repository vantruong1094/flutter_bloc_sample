import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_bloc_sample/src/listCategory/bloc/category.dart';
import 'package:flutter_bloc_sample/src/repository/base_service.dart';

class ListCategoryRepo {
  Future<List<CategoryFeatured>> getListCategoryFeatured() async {
    try {
      final resp = await BaseService().get("/collections/featured");
  
      if (resp.statusCode == 200) {
        final data = resp.data as List;
        return data.map((raw) {
          return CategoryFeatured.fromJson(raw);
        }).toList();
      } else {
        return [];
      }
    } catch(error) {
      print("Error: $error");
      return [];
    }
  }
}

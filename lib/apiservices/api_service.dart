import 'dart:convert';

import 'package:assignment/models/models.dart';
import 'package:http/http.dart' as http;

class ApiService{

  final String baseUrl="https://coinoneglobal.in/crm/";

Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateCategoryList?PrmCmpId=1&PrmBrId=2'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Category> categories = [];
      for (var item in data) {
        categories.add(Category.fromJson(item));
      }
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
  Future<List<SubCategory>> fetchSubCategories(int categoryId) async {
    final response = await http.get(Uri.parse('https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateSubCategoryList?PrmCmpId=1&PrmBrId=2&PrmCategoryId=$categoryId'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<SubCategory> subCategories = [];
      for (var item in data) {
        subCategories.add(SubCategory.fromJson(item));
      }
      return subCategories;
    } else {
      throw Exception('Failed to load subcategories');
    }
  }

}
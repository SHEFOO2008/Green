import 'dart:convert';
import 'package:http/http.dart' as http;

import '../shared/constants.dart';

class CategoriesModel
{
  bool? status;
  List<Categories>? categories = [];
  int? currentPage;

  CategoriesModel({
    this.status,
    this.categories,
    this.currentPage,
  });

  getData()
  async{
    CategoriesDataModel categoriesDataModel = CategoriesDataModel();

    await categoriesDataModel.init();
    categories = categoriesDataModel.categories;
  }
  CategoriesModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    currentPage = json['data']['current_page'];
  }
}

class CategoriesDataModel {

  List<Categories> categories = [];
  Future getCategories()
  async{
    var response = await http.get(
      Uri.https('student.valuxapps.com', 'api/categories'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
        'lang' : lang,
      },
    );
    var jsonData = json.decode(response.body)['data']['data'];
    for(var u in jsonData)
    {
      Categories category = Categories(id: u['id'],name: u['name'] ,image: u['image']);
      categories.add(category);
    }
    return categories;
  }

  Future init ()
  async {
    await getCategories();
  }
}

class Categories
{
  int? id;
  String? name;
  String? image;

  Categories({
    required this.id,
    required this.name,
    required this.image,
  });

  Categories.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }
}
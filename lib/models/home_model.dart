import 'dart:convert';
import 'package:green/shared/styles/themes.dart';
import 'package:http/http.dart' as http;

class HomeModel
{
  bool? status;
  List<BannerModel>? banners = [];
  List<ProductModel>? products = [];
  HomeModel({
    this.status,
    this.banners,
    this.products,
  });
  getData()
  async{
    HomeDataModel homeDataModel = HomeDataModel();

    await homeDataModel.init();
    banners = homeDataModel.banners;
    products = homeDataModel.products;
  }
  HomeModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
  }
}

class HomeDataModel
{

  List<BannerModel> banners = [];
  List<ProductModel> products = [];
  Future getBanners()
  async{
    var response = await http.get(
      Uri.https('student.valuxapps.com', 'api/banners'),
    );
    var jsonData = json.decode(response.body)['data'];
    for(var u in jsonData)
      {
          BannerModel banner = BannerModel(id: u['id'], image: u['image']);
          banners.add(banner);
      }
    return banners;
  }
  Future getProducts()
  async{
    var response = await http.get(
      Uri.https('student.valuxapps.com', 'api/products'),
    );
    var jsonData = json.decode(response.body)['data']['data'];
    for(var u in jsonData)
    {
      ProductModel product = ProductModel(id: u['id'], name: u['name'], price: u['price'], image: u['image'], oldPrice: u['old_price'], discount: u['discount'], inCart: u['in_cart'], inFavourites: u['in_favourites'],);
      products.add(product);
    }
    return products;
  }

  Future init ()
  async {
    await getBanners();
    await getProducts();
  }
}

class BannerModel
{
  int? id;
  String? image;
  BannerModel({
    required this.id,
    required this.image,
});

  BannerModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel
{
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  bool? inFavourites;
  bool? inCart;
  
  ProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.inFavourites,
    required this.inCart,
  });


  ProductModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavourites = json['in_favourites'];
    inCart = json['in_cart'];
  }
}
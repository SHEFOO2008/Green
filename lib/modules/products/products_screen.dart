import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/models/categories_model.dart';
import 'package:green/models/home_model.dart';
import 'package:green/modules/login/cubit/cubit.dart';
import 'package:green/shared/styles/colors.dart';
import 'package:like_button/like_button.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCubit()
            ..getHomeData()
            ..getCategories(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ShopCubit cubit = ShopCubit.get(context);
          List<BannerModel> banners = [];
          for (var banner in cubit.homeModel?.banners ?? []) {
            banners.add(banner);
          }
          return ConditionalBuilder(
            condition: cubit.homeModel != null && cubit.categoriesModel != null,
            builder: (context) => buildProducts(
                cubit.homeModel!, banners, cubit.categoriesModel!, context),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget buildProducts(HomeModel model, List<BannerModel> banners,
          CategoriesModel categoriesModel, BuildContext context) =>
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
              text: "Hello, ",
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Lato-Regular',
                fontSize: 30.0,
              ),
              children: [
                TextSpan(
                  //TODO: Add User Name
                  text: 'Ahmed',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 30.0,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            )),
            CarouselSlider(
                items: banners
                    .map((e) => Image(
                          image: NetworkImage(e.image!),
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  //aspectRatio: 2.0,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.9,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                )),
            const SizedBox(height: 10),
            SizedBox(
              height: 150.0,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    buildCategoryItem(
                        categoriesModel.categories![index], context),
                itemCount: categoriesModel.categories!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 10);
                },
              ),
            ),
            Container(
              color: Colors.grey,
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 1 / 1.8,
                children: List.generate(
                    model.products!.length,
                    (index) =>
                        buildGridProduct(model.products![index], context)),
              ),
            ),
          ],
        ),
      );
}

Widget buildCategoryItem(Categories model, BuildContext context) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: greenColor, width: 4),
          borderRadius: BorderRadius.circular(500),
          image: DecorationImage(
            image: NetworkImage(model.image!),
            fit: BoxFit.cover,
          ),
        ),
        width: 120,
        height: 120,
      ),
      Text(
        model.name!,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.black),
      )
    ],
  );
}

Widget buildGridProduct(ProductModel model, BuildContext context) => Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LikeButton(
              mainAxisAlignment: MainAxisAlignment.end,
              onTap: (bool isLiked) async {
                isLiked = !isLiked;
                ShopCubit.get(context).changeFavorites(model.id!);
                return isLiked;
              },
              isLiked: ShopCubit.get(context).favourites[model.id]!,
              size: 25,
              circleColor: const CircleColor(
                start: Colors.red,
                end: Colors.redAccent,
              ),
              bubblesColor: const BubblesColor(
                dotPrimaryColor: Colors.red,
                dotSecondaryColor: Colors.redAccent,
              ),
              likeBuilder: (bool isLiked) {
                return Icon(
                  ShopCubit.get(context).favourites[model.id]!
                      ? Icons.favorite
                      : Icons.favorite_border,
                  size: 25.0,
                  color: ShopCubit.get(context).favourites[model.id]!
                      ? Colors.redAccent
                      : Colors.black,
                );
              },
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(model.image!),
                width: double.infinity,
                height: 200,
              ),
              if (model.discount != 0)
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: const Text(
                    'DISCOUNT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15.0,
                    height: 1.3,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //if(model.discount != 0)
                    Text(
                      '${model.oldPrice.round()}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '${model.price.round()} EGP',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: greenColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/layout/cubit/cubit.dart';
import 'package:green/models/categories_model.dart';

import '../../layout/cubit/states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (context) => ShopCubit()..getCategories()..getHomeData(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ShopCubit cubit = ShopCubit.get(context);
          return ConditionalBuilder(
              condition: cubit.categoriesModel?.categories != null,
              builder: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),

                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (BuildContext context, int index) => buildCatItem(cubit.categoriesModel!.categories![index]),
                itemCount: cubit.categoriesModel?.categories?.length ?? 0,

              ),
              fallback: (context) => const Center(child: CircularProgressIndicator()),
          );
        }
      ),
    );
  }

  Widget buildCatItem(Categories model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(model.image!),
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          model.name!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
      ],
    ),
  );
}

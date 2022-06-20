import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/layout/cubit/cubit.dart';
import 'package:green/layout/cubit/states.dart';
import 'package:green/modules/settings/settings_screen.dart';
import 'package:green/shared/functions.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getHomeData()..getCategories(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Green'),
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    navigateTo(const SettingsScreen(), context);
                  },
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.grid_view), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favourites'),
              ],
              onTap: ((index) {
                cubit.changeBottom(index);
              }),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                ShopCubit().getHomeData();
                },
            ),
          );
        },
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Ahmed',
    'Sherif',
    'Rawda',
    'Mariam',
    'Mohamed',
    'Mahmoud',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var name in searchTerms) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var name in searchTerms) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
        );
      },
    );
  }
}

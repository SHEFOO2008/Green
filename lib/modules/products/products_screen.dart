import 'package:flutter/material.dart';

import '../../layout/cubit/cubit.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            'Products Screen',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}


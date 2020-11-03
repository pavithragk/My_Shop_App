import 'package:flutter/material.dart';

import 'package:my_shop_app/providers/product_provider.dart';
import 'package:my_shop_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = (showFavs) ? productData.favoriteItems : productData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: products.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: products[index],
            // create: (context) => products[index],
            child: ProductItem(
                // products[index].id, products[index].title,
                //   products[index].imageUrl
                )));
  }
}

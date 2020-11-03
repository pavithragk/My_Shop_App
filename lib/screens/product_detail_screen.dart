import 'package:flutter/material.dart';
import 'package:my_shop_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/detail-screen';
  // final String title;
  // ProductDetailScreen(this.title);
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final productLoaded =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(productLoaded.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  productLoaded.imageUrl,
                  fit: BoxFit.cover,
                )),
            SizedBox(height: 10),
            Text(
              '\$${productLoaded.price}',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              productLoaded.description,
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }
}

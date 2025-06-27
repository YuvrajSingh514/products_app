import 'package:flutter/material.dart';
import 'package:products_app/products/bloc/products_bloc.dart';
import 'package:products_app/products/widget/products_card.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products', style: TextStyle(fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: ProductsCard()),
    );
  }
}

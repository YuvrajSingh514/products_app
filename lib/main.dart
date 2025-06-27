import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/products/bloc/products_bloc.dart';
import 'package:products_app/screens/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider<ProductsBloc>(create: (context)=> ProductsBloc())
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: ThemeData(scaffoldBackgroundColor: Colors.white),
           home: ProductsScreen(),
          );
        }
      ),
    );
  }
}

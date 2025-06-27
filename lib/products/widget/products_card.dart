import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/products/bloc/products_bloc.dart';

class ProductsCard extends StatefulWidget {
  const ProductsCard({super.key});

  @override
  State<ProductsCard> createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsBloc>(context).add(GetProductsList());
  }
    @override
    Widget build(BuildContext context) {
      return BlocBuilder(
        bloc: BlocProvider.of<ProductsBloc>(context),
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductsLoadedState) {
            return SizedBox(
              height: 100,
              width: 100,

              child: GridView.builder(
                itemCount: state.productsList.length,
                scrollDirection: Axis.vertical,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            state.productsList[index].thumbnail.toString(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (state is ProductsErrorState) {
            return Center(child: Text(state.error));
          }
          return Container();
        },
      );
    }
  }

